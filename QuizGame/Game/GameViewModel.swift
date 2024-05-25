//
//  GameViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 21/05/24.
//

import SwiftUI

protocol GameViewModelProtocol {
    var generatedGame: GeneratedGame { get }
    var nextQuestionId: Int { get }
    var shouldDisplayNextButton: Bool { get }

    func didAnswer(questionID: Int, answer: String) -> Bool
    func didScrollToNextQuestion()
}

@Observable final class GameViewModel: GameViewModelProtocol {

    private var answeredQuestions = 0
    let generatedGame: GeneratedGame
    var nextQuestionId: Int = 0
    private var rightAnswers = 0
    var shouldDisplayNextButton = false

    @ObservationIgnored
    private lazy var questions: [Int: GeneratedQuestion] = {
        Dictionary<Int, Any>.from(generatedGame.questions, keyPath: \.id)
    }()

    init(generatedGame: GeneratedGame) {
        self.generatedGame = generatedGame
    }

    func didAnswer(questionID: Int, answer: String) -> Bool {
        answeredQuestions += 1

        shouldDisplayNextButton = answeredQuestions != questions.count
        nextQuestionId = questionID + 1

        let question = questions[questionID]
        if question?.correctAnswer == answer {
            rightAnswers += 1
        }

        return question?.correctAnswer == answer
    }

    func didScrollToNextQuestion() {
        shouldDisplayNextButton = false
    }

}
