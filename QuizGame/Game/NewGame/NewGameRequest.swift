//
//  NewGameRequest.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

struct NewGameRequest: Requestable {
    let body: Encodable? = OpenAIChatRequest()
    let headers: HTTPHeaders? = nil
    let method: HTTPMethod = .post
    let parameters: QueryParameters? = nil
    let path: String = "chat/completions"
}

struct OpenAIChatRequest: Encodable {
    let model = "gpt-3.5-turbo"
    let messages: [OpenAIChatMessage] = [
        .init(
            role: "system",
            content: "You are a quiz game assistant that generates a new game based on the theme chosen by the user. You output the game in JSON format following this schema {\"type\":\"object\",\"properties\":{\"theme\":{\"type\":\"string\"},\"questions\":{\"type\":\"array\",\"items\":{\"type\":\"object\",\"properties\":{\"id\":{\"type\":\"integer\"},\"topic\":{\"type\":\"string\"},\"question\":{\"type\":\"string\"},\"answers\":{\"type\":\"array\",\"items\":{\"type\":\"string\"}},\"correctAnswer\":{\"type\":\"integer\"}},\"required\":[\"id\",\"topic\",\"question\",\"answers\",\"correctAnswer\"]}}},\"required\":[\"theme\",\"questions\"]}. The game should have 5 questions of increasing difficulty. Questions should have only 1 correct answer."
        ),
        .init(
            role: "user",
            content: "Generate a JSON quiz game based on the theme: Computer science."
        )
    ]
    let stream = false
}

struct OpenAIChatMessage: Codable {
    let role: String
    let content: String
}
