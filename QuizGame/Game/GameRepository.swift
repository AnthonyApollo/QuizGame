//
//  GameRepository.swift
//  QuizGame
//
//  Created by Anthony Apollo on 25/05/24.
//

import SwiftData

protocol GameRepositoryProtocol {
    func save(game: PreviousGame)
}

struct GameRepository: GameRepositoryProtocol {
    let modelContext: ModelContext

    func save(game: PreviousGame) {
        modelContext.insert(game)
    }
}
