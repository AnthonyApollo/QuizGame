//
//  NewGameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 03/01/24.
//

import SwiftUI

struct NewGameView: View {
    @EnvironmentObject var viewModel: NewGameViewModel

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
                    viewModel.createGame()
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
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView()
            .environmentObject(NewGameViewModel())
    }
}
