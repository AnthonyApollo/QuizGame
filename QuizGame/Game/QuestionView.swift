//
//  QuestionView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 15/01/24.
//

import SwiftUI

struct QuestionView: View {
    let viewModel: GameViewModelProtocol
    var generatedQuestion: GeneratedQuestion

    var body: some View {
        VStack(alignment: .leading) {
            Text(generatedQuestion.topic)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom)

            Text(generatedQuestion.question)
                .font(.title2)
                .bold()
                .padding(.bottom)

            AlternativesView(viewModel: viewModel, generatedQuestion: generatedQuestion)

            Spacer()
                .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct AlternativesView: View {
    let viewModel: GameViewModelProtocol
    var generatedQuestion: GeneratedQuestion

    @State private var selectedAnswer: String?
    @State private var isQuestionAnswered: Bool = false
    @State private var isRightAnswer: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(generatedQuestion.answers, id: \.self) { answer in
                HStack(alignment: .center) {
                    Button(answer) {
                        guard isQuestionAnswered else {
                            selectedAnswer = answer
                            return
                        }
                    }
                    .buttonStyle(.bordered)
                    .font(.title3)
                    .tint(getColor(by: answer, isSelected: selectedAnswer == answer))

                    if selectedAnswer == answer && !isQuestionAnswered {
                        Button {
                            isRightAnswer = viewModel.didAnswer(questionID: generatedQuestion.id, answer: answer)
                            isQuestionAnswered = true
                        } label: {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title)
                        }
                    }

                    if selectedAnswer == answer && isQuestionAnswered {
                        Image(systemName: isRightAnswer ? "checkmark" : "xmark")
                            .foregroundStyle(isRightAnswer ? Color.green : Color.red)
                    }
                }
                .padding(.bottom)
            }
        }
    }

    private func getColor(by answer: String, isSelected: Bool) -> Color {
        guard isQuestionAnswered else {
            return isSelected ? .blue : .secondary
        }

        return generatedQuestion.correctAnswer == answer ? .green : .red
    }
}

#Preview {
    QuestionView(viewModel: GameViewModel(generatedGame: .fixture(), repository: GameRepositoryStub()),
                 generatedQuestion: GeneratedGame.fixture().questions.first!)
}
