//
//  APIConstants.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Foundation

enum APIConstants {
    static let openAIBaseURL = URL(string: "https://api.openai.com/v1")!
    static let defaultHeaders: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Authorization": "Bearer \(ProcessInfo.processInfo.environment["OPEN_AI_API_KEY"]!)"
    ]
}
