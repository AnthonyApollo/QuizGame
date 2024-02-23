//
//  NewGameRepositoryStub.swift
//  QuizGame
//
//  Created by Anthony Apollo on 13/02/24.
//

import Combine

struct NewGameRepositoryStub: NewGameRepositoryProtocol {
    
    func createGame(withTheme theme: String, model: GPTModel, numberOfQuestions: Int) -> AnyPublisher<GeneratedGame, Error> {
        Just(GeneratedGame.fixture())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

}
