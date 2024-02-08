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
        }
    }
}

struct LoadingGameView: View {
    @EnvironmentObject var viewModel: NewGameViewModel

    var body: some View {
        VStack {
            Text("Loading game...")
                .font(.largeTitle)
                .bold()

            Button {
                viewModel.cancel()
            } label: {
                Text("Cancel")
            }
        }
    }
}


struct GeneratedGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(NewGameViewModel())
    }
}
