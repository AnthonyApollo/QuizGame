//
//  NewGameRepository.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Combine
import Foundation

final class NewGameRepository {

    var httpClient: CombineHTTPClientProtocol = CombineHTTPClient()
    var decoder: JSONDecoder = .init()

    func createGame(withTheme theme: String) -> AnyPublisher<GeneratedGame, Error> {
        let response: AnyPublisher<OpenAIChatResponse?, RequestError> = httpClient.requestJSON(for: NewGameRequest())

        return response
            .compactMap { $0?.choices.first?.message.content.data(using: .utf8) }
            .decode(type: GeneratedGame.self, decoder: decoder)
            .eraseToAnyPublisher()
    }

}
