//
//  GeneratedGame+Dummy.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

extension GeneratedGame {

    static func dummy() -> GeneratedGame {
        .init(
            theme: "General Knowledge",
            questions: [.init(id: 0, topic: "Geography", question: "What is the capital of France?", answers: ["Berlin", "Madrid", "Rome", "Paris"], correctAnswer: 3),
                        .init(id: 1, topic: "Science", question: "What is the chemical symbol for the element oxygen?", answers: ["O2", "O", "Ox", "Oy"], correctAnswer: 1),
                        .init(id: 2, topic: "History", question: "Who was the first President of the United States?", answers: ["Thomas Jefferson", "John Adams", "George Washington", "Benjamin Franklin"], correctAnswer: 2),
                        .init(id: 3, topic: "Sports", question: "Which sport is played at Wimbledon?", answers: ["Golf", "Soccer", "Tennis", "Cricket"], correctAnswer: 2),
                        .init(id: 4, topic: "Entertainment", question: "Which movie won the Academy Award for Best Picture in 2020?", answers: ["The Irishman", "1917", "Parasite", "Joker"], correctAnswer: 2)
            ]
        )
    }

}
