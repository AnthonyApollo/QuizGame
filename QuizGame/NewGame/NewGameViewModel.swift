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
    @Published var shouldPresentGame: Bool = false

    private let repository: NewGameRepositoryProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(repository: NewGameRepositoryProtocol = NewGameRepository()) {
        self.repository = repository
    }

    func createGame() {
        shouldPresentGame = true

        repository.createGame(withTheme: gameTheme)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure = completion {
                    // TODO: Handle error
                    self.shouldPresentGame = false
                }
            } receiveValue: { generatedGame in
                self.generatedGame = generatedGame
            }
            .store(in: &subscriptions)
    }

    func cancel() {
        shouldPresentGame = false
        subscriptions.forEach { $0.cancel() }
    }
}
