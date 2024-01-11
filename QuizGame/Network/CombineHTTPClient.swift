//
//  CombineHTTPClient.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Foundation
import Combine

protocol CombineHTTPClientProtocol {
    func requestJSON<T: Decodable>(for requestable: Requestable) -> AnyPublisher<T, Error>
}

protocol Requestable {
    var body: Encodable? { get }
    var headers: HTTPHeaders? { get }
    var method: HTTPMethod { get }
    var parameters: QueryParameters? { get }
    var path: String { get }
}

protocol URLRequestMapper {
    func map(_ requestable: Requestable) throws -> URLRequest
}

enum HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}

typealias HTTPHeaders = [String: String]
typealias QueryParameters = [String: Any]

struct CombineHTTPClient {
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

extension CombineHTTPClient: CombineHTTPClientProtocol {
    func requestJSON<T: Decodable>(for requestable: Requestable) -> AnyPublisher<T, Error> {
        do {
            let urlRequest = try requestMapper.map(requestable)
            return urlSession.dataTaskPublisher(for: urlRequest)
                .map(\.data)
                .decode(type: T.self, decoder: decoder)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
