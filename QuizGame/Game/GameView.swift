//
//  GameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import SwiftUI

struct GameView: View {
    @Environment(NewGameViewModel.self) var viewModel

    var body: some View {
        if let errorMessage = viewModel.errorMessage {
            GenerationErrorView(errorMessage: errorMessage)
        } else if let generatedGame = viewModel.generatedGame {
            let gameViewModel = GameViewModel(generatedGame: generatedGame)
            QuestionsView(viewModel: gameViewModel)
                .onDisappear {
                    viewModel.clearGame()
                }
        } else {
            LoadingGameView()
                .onAppear {
                    viewModel.createGame()
                }
                .onDisappear {
                    viewModel.cancel()
                }
        }
    }
}

struct LoadingGameView: View {
    var body: some View {
        Text("Loading game...")
            .font(.largeTitle)
            .bold()
    }
}

#Preview {
    GameView()
        .environment(NewGameViewModel(repository: NewGameRepositoryStub()))
}
