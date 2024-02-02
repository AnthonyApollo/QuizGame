//
//  QuestionView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 15/01/24.
//

import SwiftUI

struct QuestionView: View {
    var generatedQuestion: GeneratedQuestion
    var onAnswered: () -> Void
    @State private var selectedAnswer: String?

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
                        HStack(alignment: .center) {
                            Button(answer) {
                                selectedAnswer = answer
                            }
                            .padding(.bottom, 12)
                            .buttonStyle(.borderedProminent)
                            .font(.title3)
                            .cornerRadius(10)
                            .tint(selectedAnswer == answer ? .blue : .secondary)

                            if selectedAnswer == answer {
                                Button {
                                    if selectedAnswer == generatedQuestion.correctAnswer {
                                        // TODO: Style correct answer
                                    }

                                    onAnswered()
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.title)
                                }
                            }
                        }
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
        QuestionView(generatedQuestion: GeneratedGame.dummy().questions.first!) {
            
        }
    }
}
