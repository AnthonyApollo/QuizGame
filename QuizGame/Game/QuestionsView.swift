//
//  QuestionsView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 07/02/24.
//

import SwiftUI

struct QuestionsView: View {
    var generatedGame: GeneratedGame

    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { scrollView in
                ScrollView([.vertical], showsIndicators: false) {
                    LazyVStack {
                        ForEach(generatedGame.questions, id: \.id) { question in
                            QuestionView(generatedQuestion: question, hasNextQuestion: question.id + 1 <= generatedGame.questions.count) {
                                withAnimation {
                                    scrollView.scrollTo(question.id + 1, anchor: .leading)
                                }
                            }
                            .frame(height: proxy.size.height)
                            .id(question.id)
                        }
                    }
                }
                .scrollDisabled(true)
            }
        }
        .navigationTitle(generatedGame.theme)
    }
}

#Preview {
    QuestionsView(generatedGame: .fixture())
}
