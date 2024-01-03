//
//  NewGameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 03/01/24.
//

import SwiftUI

struct NewGameView: View {
    @State private var gameTheme: String = ""
    
    var body: some View {
        VStack {
            Spacer()

            Text("What's the theme of your challenge?")
                .font(.largeTitle)
                .bold()

            Spacer()

            HStack {
                TextField("Rocket science", text: $gameTheme)
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