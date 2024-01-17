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

    private var repository: NewGameRepository = .init()
    private var subscriptions = Set<AnyCancellable>()

    func createGame() {
        repository.createGame(withTheme: gameTheme)
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
}
