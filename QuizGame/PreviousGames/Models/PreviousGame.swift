//
//  PreviousGame.swift
//  QuizGame
//
//  Created by Anthony Apollo on 25/05/24.
//

import SwiftData

@Model
class PreviousGame {
    let theme: String
    let rightAnswers: Int
    let wrongAnswers: Int
    let questions: [AnsweredQuestion]

    init(theme: String, rightAnswers: Int, wrongAnswers: Int, questions: [AnsweredQuestion]) {
        self.theme = theme
        self.rightAnswers = rightAnswers
        self.wrongAnswers = wrongAnswers
        self.questions = questions
    }
}

@Model
class AnsweredQuestion {
    let id: Int
    let topic: String
    let question: String
    let answers: [String]
    let correctAnswer: String
    let selectedAnswer: String

    init(
        generatedQuestion: GeneratedQuestion,
        selectedAnswer: String
    ) {
        self.id = generatedQuestion.id
        self.topic = generatedQuestion.topic
        self.question = generatedQuestion.question
        self.answers = generatedQuestion.answers
        self.correctAnswer = generatedQuestion.correctAnswer
        self.selectedAnswer = selectedAnswer
    }
}
