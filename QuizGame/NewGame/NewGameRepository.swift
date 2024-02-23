//
//  NewGameRepository.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Combine
import Foundation

protocol NewGameRepositoryProtocol {
    func createGame(withTheme theme: String, numberOfQuestions: Int) -> AnyPublisher<GeneratedGame, Error>
}

final class NewGameRepository: NewGameRepositoryProtocol {

    var httpClient: CombineHTTPClientProtocol = CombineHTTPClient()
    var decoder: JSONDecoder = .init()

    func createGame(withTheme theme: String, numberOfQuestions: Int) -> AnyPublisher<GeneratedGame, Error> {
        let response: AnyPublisher<OpenAIChatResponse, Error> = httpClient.requestJSON(for: NewGameRequest(gameTheme: theme, numberOfQuestions: numberOfQuestions))

        return response
            .compactMap { $0.choices.first?.message.content.data(using: .utf8) }
            .decode(type: GeneratedGame.self, decoder: decoder)
            .eraseToAnyPublisher()
    }

}
