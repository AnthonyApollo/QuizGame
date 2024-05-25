//
//  QuestionsView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 07/02/24.
//

import SwiftUI

struct QuestionsView: View {
    @State var viewModel: GameViewModelProtocol
    @State private var currentQuestion = 1

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollViewReader { scrollView in
                    VStack {
                        ScrollView([.vertical], showsIndicators: false) {
                            LazyVStack {
                                ForEach(viewModel.generatedGame.questions, id: \.id) { question in
                                    QuestionView(viewModel: viewModel, generatedQuestion: question)
                                        .frame(height: proxy.size.height)
                                        .id(question.id)
                                }
                            }
                        }
                        .scrollDisabled(true)

                        if viewModel.shouldDisplayNextButton {
                            Button {
                                viewModel.didScrollToNextQuestion()
                                withAnimation {
                                    scrollView.scrollTo(viewModel.nextQuestionId, anchor: .leading)
                                }
                                currentQuestion += 1
                            } label: {
                                VStack {
                                    Text("Next")
                                    Image(systemName: "arrow.down")
                                }
                            }
                        } else if viewModel.shouldDisplayFinishButton {
                            Button {
                                viewModel.didSelectFinishGame()
                            } label: {
                                Text("Finish")
                            }
                        } else {
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("\(viewModel.generatedGame.theme) \(currentQuestion)/\(viewModel.generatedGame.questions.count)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    QuestionsView(viewModel: GameViewModel(generatedGame: .fixture()))
}
