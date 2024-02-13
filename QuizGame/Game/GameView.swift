//
//  GameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: NewGameViewModel

    var body: some View {
        if let generatedGame = viewModel.generatedGame {
            QuestionsView(generatedGame: generatedGame)
        } else {
            LoadingGameView()
                .onAppear {
                    viewModel.createGame()
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
        GameView()
            .environmentObject(NewGameViewModel())
    }
}
