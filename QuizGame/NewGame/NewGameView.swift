//
//  NewGameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 03/01/24.
//

import SwiftUI

struct NewGameView: View {
    @State var viewModel: NewGameViewModelProtocol
    @State private var shouldPresentGameSheet = false

    var body: some View {
        VStack {
            Spacer()

            Text("What's the theme of your challenge?")
                .font(.largeTitle)
                .bold()

            Spacer()

            HStack {
                TextField("Rocket science", text: $viewModel.gameTheme)
                    .textFieldStyle(.roundedBorder)

                Button {
                    shouldPresentGameSheet.toggle()
                } label: {
                    if viewModel.gameTheme.isEmpty {
                        Image(systemName: "arrow.up.circle")
                    } else {
                        Image(systemName: "arrow.up.circle.fill")
                    }
                }
                .font(.title2)
                .disabled(viewModel.gameTheme.isEmpty)
                .animation(.default, value: viewModel.gameTheme.isEmpty)
            }
            .padding()
        }
        .sheet(isPresented: $shouldPresentGameSheet) {
            GameView(viewModel: viewModel)
        }
    }
}

#Preview {
    NewGameView(viewModel: NewGameViewModel(repository: NewGameRepositoryStub()))
}
