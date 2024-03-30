//
//  GameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import SwiftUI

struct GameView<ViewModel: NewGameViewModelProtocol>: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        if let generatedGame = viewModel.generatedGame {
            QuestionsView(generatedGame: generatedGame)
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
    @EnvironmentObject var viewModel: NewGameViewModel

    var body: some View {
        Text("Loading game...")
            .font(.largeTitle)
            .bold()
    }
}


struct GeneratedGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView<NewGameViewModel>()
            .environmentObject(NewGameViewModel(repository: NewGameRepositoryStub()))
    }
}
