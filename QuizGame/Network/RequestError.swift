//
//  RequestError.swift
//  QuizGame
//
//  Created by Anthony Apollo on 10/01/24.
//

struct RequestError: RawRepresentable, Error {
    static let url = RequestError(rawValue: "Failed to construct a valid URL.")

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
