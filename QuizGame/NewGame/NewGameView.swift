//
//  NewGameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 03/01/24.
//

import SwiftUI

struct NewGameView: View {
    @Environment(NewGameViewModel.self) var viewModel
    var confirmAction: (() -> Void)?

    var body: some View {
        VStack {
            Spacer()

            Text("What's the theme of your challenge?")
                .font(.largeTitle)
                .bold()

            Spacer()

            HStack {
                @Bindable var viewModel = viewModel
                TextField("Rocket science", text: $viewModel.gameTheme)
                    .textFieldStyle(.roundedBorder)

                Button {
                    confirmAction?()
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
            .environment(NewGameViewModel(repository: NewGameRepositoryStub()))
    }
}
