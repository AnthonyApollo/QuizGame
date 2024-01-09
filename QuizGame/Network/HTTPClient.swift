//
//  HTTPClient.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Foundation
import Combine

protocol CombineHTTPClientProtocol {
    func request(_ requestable: Requestable) -> AnyPublisher<RequestResult, RequestError>
    func requestJSON<T: Decodable>(for requestable: Requestable) -> AnyPublisher<T?, RequestError>
}

struct CombineHTTPClient: CombineHTTPClientProtocol {
    private typealias QueuedPublisher = Publishers.ReceiveOn<URLSession.DataTaskPublisher, DispatchQueue>

    private let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)
    private let decoder: JSONDecoder = JSONDecoder()
    private let requestMapper: URLRequestMapper = OpenAIRequestMapper()
    private let urlSession: URLSession = .shared

    private func request(_ urlRequest: URLRequest) -> QueuedPublisher {
        urlSession.dataTaskPublisher(for: urlRequest)
            .receive(on: apiQueue)
    }
}

extension CombineHTTPClient {
    func request(_ requestable: Requestable) -> AnyPublisher<RequestResult, RequestError> {
        do {
            let urlRequest = try requestMapper.map(requestable)
            return request(urlRequest)
        } catch {
            return Just(RequestResult.failure(error))
                .setFailureType(to: RequestError.self)
                .eraseToAnyPublisher()
        }
    }

    private func request(_ urlRequest: URLRequest) -> AnyPublisher<RequestResult, RequestError> {
        request(urlRequest)
            .map { map($0.response) }
            .mapError { _ in .url }
            .eraseToAnyPublisher()
    }

    private func map(_ urlResponse: URLResponse) -> RequestResult {
        guard let urlResponse = urlResponse as? HTTPURLResponse else {
            return .failure(RequestError.unknown)
        }

        switch urlResponse.statusCode {
        case (200..<300):
            return .success
        default:
            return .failure(RequestError.apiError)
        }
    }
}

extension CombineHTTPClient {
    func requestJSON<T: Decodable>(for requestable: Requestable) -> AnyPublisher<T?, RequestError> {
        do {
            let urlRequest = try requestMapper.map(requestable)
            return requestJSON(for: urlRequest)
        } catch {
            return Just(nil)
                .setFailureType(to: RequestError.self)
                .eraseToAnyPublisher()
        }
    }

    func requestJSON<T: Decodable>(for urlRequest: URLRequest) -> AnyPublisher<T, RequestError> {
        request(urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .mapError(mapRequestError)
            .eraseToAnyPublisher()
    }

    private func mapRequestError(_ error: Error) -> RequestError {
        switch error {
        case is URLError:
            return .url
        case is DecodingError:
            return .decode
        default:
            return .unknown
        }
    }
}
