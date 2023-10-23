//
//  NewGameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/10/23.
//

import SwiftUI

struct NewGameView: View {
    @State private var gameTheme: String = ""

    var body: some View {
        VStack {
            Spacer()

            Text("Qual é o tema do seu novo jogo?")
                .font(.largeTitle)
                .bold()

            Spacer()

            HStack {
                TextField("Custom theme", text: $gameTheme)
                    .textFieldStyle(.roundedBorder)

                Button {
                    // TODO: Implement button action
                } label: {
                    if gameTheme.isEmpty {
                        Image(systemName: "arrow.up.circle")
                    } else {
                        Image(systemName: "arrow.up.circle.fill")
                    }
                }
                .font(.title2)
                .disabled(gameTheme.isEmpty)
                .animation(.default, value: gameTheme.isEmpty)
            }
            .padding()
        }
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView()
    }
}
