//
//  GeneratedGame+Dummy.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

extension GeneratedGame {

    static func fixture(
        theme: String? = nil,
        questions: [GeneratedQuestion]? = nil
    ) -> GeneratedGame {
        .init(
            theme: theme ?? "General Knowledge",
            questions: questions ?? [.init(id: 0, topic: "Geography", question: "What is the capital of France?", answers: ["Berlin", "Madrid", "Rome", "Paris"], correctAnswer: "Paris"),
                                     .init(id: 1, topic: "Science", question: "What is the chemical symbol for the element oxygen?", answers: ["O2", "O", "Ox", "Oy"], correctAnswer: "O"),
                                     .init(id: 2, topic: "History", question: "Who was the first President of the United States?", answers: ["Thomas Jefferson", "John Adams", "George Washington", "Benjamin Franklin"], correctAnswer: "George Washington"),
                                     .init(id: 3, topic: "Sports", question: "Which sport is played at Wimbledon?", answers: ["Golf", "Soccer", "Tennis", "Cricket"], correctAnswer: "Tennis"),
                                     .init(id: 4, topic: "Entertainment", question: "Which movie won the Academy Award for Best Picture in 2020?", answers: ["The Irishman", "1917", "Parasite", "Joker"], correctAnswer: "Parasite")
            ]
        )
    }

}
