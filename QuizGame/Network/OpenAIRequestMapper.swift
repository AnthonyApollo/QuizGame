//
//  OpenAIRequestMapper.swift
//  QuizGame
//
//  Created by Anthony Apollo on 05/01/24.
//

import Foundation

struct OpenAIRequestMapper: URLRequestMapper {
    var encoder: JSONEncoder = JSONEncoder()

    func map(_ requestable: Requestable) throws -> URLRequest {
        var urlComponents = URLComponents(url: APIConstants.openAIBaseURL.appendingPathComponent(requestable.path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = requestable.parameters?.compactMap { URLQueryItem(name: $0.key, value: "\($0.value)") }

        guard let url = urlComponents?.url else {
            throw RequestError.url
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = APIConstants.defaultHeaders
        urlRequest.allHTTPHeaderFields?.merge(requestable.headers ?? [:], uniquingKeysWith: { (current, _) in current })
        urlRequest.httpMethod = requestable.method.rawValue
        if let body = requestable.body {
            urlRequest.httpBody = try encoder.encode(body)
        }

        return urlRequest
    }
}
