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
            VStack {
                Text(generatedGame.theme)
                    .font(.headline)

                ScrollViewReader { scrollView in
                    ScrollView([.horizontal], showsIndicators: false) {
                        LazyHStack {
                            ForEach(generatedGame.questions, id: \.id) { question in
                                QuestionView(generatedQuestion: question) {
                                    withAnimation {
                                        scrollView.scrollTo(question.id + 1, anchor: .leading)
                                    }
                                }
                                .frame(width: proxy.size.width)
                                .id(question.id)
                            }
                        }
                    }
                    .scrollDisabled(true)
                }
            }
        }
    }
}

#Preview {
    QuestionsView(generatedGame: .dummy())
}
