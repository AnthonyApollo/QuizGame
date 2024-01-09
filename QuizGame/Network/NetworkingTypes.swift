//
//  HTTPMethod.swift
//  QuizGame
//
//  Created by Anthony Apollo on 05/01/24.
//

import Foundation

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

enum RequestResult {
    case success
    case failure(Error)
}

struct RequestError: Error, RawRepresentable {
    static let apiError = RequestError(rawValue: "Request returned with error status code.")
    static let decode = RequestError(rawValue: "Could not decode expected object.")
    static let unknown = RequestError(rawValue: "Unknown error happened.")
    static let url = RequestError(rawValue: "Could not parse a valid URL.")

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
