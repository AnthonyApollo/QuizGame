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
                .font(.headline)

            ZStack {
                ForEach(generatedGame.questions) { generatedQuestion in
                    QuestionView(generatedQuestion: generatedQuestion)
                }
            }

            Spacer()
        }
    }
}


struct GeneratedGameView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedGameView(generatedGame: .dummy())
    }
}
