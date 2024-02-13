//
//  QuestionView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 15/01/24.
//

import SwiftUI

struct QuestionView: View {
    var generatedQuestion: GeneratedQuestion
    var hasNextQuestion: Bool
    var nextQuestionAction: () -> Void
    @State private var selectedAnswer: String?
    @State private var isQuestionAnswered: Bool = false

    var body: some View {
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
                        .tint(getColor(by: answer, isSelected: selectedAnswer == answer))

                        if selectedAnswer == answer && !isQuestionAnswered {
                            Button {
                                isQuestionAnswered = true
                            } label: {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.title)
                            }
                        }
                    }
                }
            }

            Spacer()
                .frame(maxWidth: .infinity)

            if isQuestionAnswered && hasNextQuestion {
                Button {
                    nextQuestionAction()
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }

    private func getColor(by answer: String, isSelected: Bool) -> Color {
        guard isQuestionAnswered else {
            return isSelected ? .blue : .secondary
        }

        return generatedQuestion.correctAnswer == answer ? .green : .red
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(generatedQuestion: GeneratedGame.fixture().questions.first!, hasNextQuestion: true) {}
    }
}
