//
//  OpenAIChatResponse.swift
//  QuizGame
//
//  Created by Anthony Apollo on 09/01/24.
//

struct OpenAIChatResponse: Decodable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let choices: [OpenAIChatResponseChoices]
    let usage: OpenAIChatResponseUsage
    let system_fingerprint: String?
}

struct OpenAIChatResponseChoices: Decodable {
    let index: Int
    let message: OpenAIChatMessage
    let logprobs: String?
    let finish_reason: String
}

struct OpenAIChatResponseUsage: Decodable {
    let prompt_tokens: Int
    let completion_tokens: Int
    let total_tokens: Int
}
