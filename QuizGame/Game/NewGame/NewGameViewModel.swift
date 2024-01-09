//
//  NewGameViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 04/01/24.
//

import Combine

final class NewGameViewModel: ObservableObject {
    @Published var gameTheme: String = ""
    @Published var generatedGame: GeneratedGame?

    private var repository: NewGameRepository = .init()
    private var subscriptions = Set<AnyCancellable>()

    func createGame() {
        repository.createGame(withTheme: gameTheme)
            .sink { completion in
                print(completion)
            } receiveValue: { generatedGame in
                self.generatedGame = generatedGame
            }
            .store(in: &subscriptions)
    }
}
