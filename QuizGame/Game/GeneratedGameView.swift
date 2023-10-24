//
//  GeneratedGameView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import SwiftUI

struct GeneratedGameView: View {
    var generatedGame: GeneratedGame

    var body: some View {
        VStack {
            Text(generatedGame.theme)
            List {
                ForEach(generatedGame.questions) { generatedQuestion in
                    Section {
                        ForEach(generatedQuestion.answers.indices) { index in
                            Text(generatedQuestion.answers[index])
                        }
                    } header: {
                        Text(generatedQuestion.question)
                    }
                }
            }
        }
    }
}

struct GeneratedGameView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedGameView(generatedGame: .dummy())
    }
}
