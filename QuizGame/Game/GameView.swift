//
//  GameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import SwiftUI

struct GameView: View {
    @State var viewModel: NewGameViewModelProtocol

    var body: some View {
        GeometryReader { geometryProxy in
            if let errorMessage = viewModel.errorMessage {
                GenerationErrorView(errorMessage: errorMessage)
                    .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
            } else if let generatedGame = viewModel.generatedGame {
                let gameViewModel = GameViewModel(generatedGame: generatedGame)
                QuestionsView(viewModel: gameViewModel)
                    .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
                    .transition(.move(edge: .bottom))
            } else {
                LoadingGameView()
                    .frame(width: geometryProxy.size.width, height: geometryProxy.size.height)
            }
        }
        .animation(.default, value: viewModel.errorMessage)
        .animation(.easeInOut, value: viewModel.generatedGame)
        .onAppear {
            viewModel.createGame()
        }
        .onDisappear {
            viewModel.clearGame()
            viewModel.cancel()
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
    GameView(viewModel: NewGameViewModel(repository: NewGameRepositoryStub()))
}
