//
//  QuestionView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 15/01/24.
//

import SwiftUI

struct QuestionView: View {
    var generatedQuestion: GeneratedQuestion
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack(alignment: .leading) {
                Text(generatedQuestion.topic)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                
                Text(generatedQuestion.question)
                    .font(.title2)
                    .bold()
                
                VStack(alignment: .leading) {
                    ForEach(generatedQuestion.answers, id: \.self) { answer in
                        Button(answer, action: {})
                            .padding(.bottom, 12)
                            .buttonStyle(.bordered)
                            .foregroundColor(.primary)
                            .font(.title3)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(generatedQuestion: GeneratedGame.dummy().questions.first!)
    }
}
