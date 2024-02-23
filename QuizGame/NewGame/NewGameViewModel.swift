//
//  NewGameViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Foundation
import Combine

final class NewGameViewModel: ObservableObject {
    @Published var gameTheme: String = ""
    @Published var generatedGame: GeneratedGame?
    @Published var numberOfQuestions: Int = 5
    @Published var gptModel: GPTModel = .gpt3

    private let repository: NewGameRepositoryProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(repository: NewGameRepositoryProtocol = NewGameRepository()) {
        self.repository = repository
    }

    func createGame() {
        repository.createGame(withTheme: gameTheme,
                              model: gptModel,
                              numberOfQuestions: numberOfQuestions)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure = completion {
                    // TODO: Handle error
                }
            } receiveValue: { generatedGame in
                self.generatedGame = generatedGame
            }
            .store(in: &subscriptions)
    }

    func cancel() {
        subscriptions.forEach { $0.cancel() }
    }

    func clearGame() {
        generatedGame = nil
    }

}
