//
//  NewGameViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Foundation
import Combine

internal protocol NewGameViewModelProtocol: ObservableObject {
    var errorMessage: String? { get }
    var gameTheme: String { get set }
    var generatedGame: GeneratedGame? { get set }
    var numberOfQuestions: Int { get set }
    var gptModel: GPTModel { get set }

    func createGame()
    func cancel()
    func clearGame()
}

final class NewGameViewModel: NewGameViewModelProtocol {
    @Published var errorMessage: String?
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
                    self.errorMessage = "Error generating game"
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
