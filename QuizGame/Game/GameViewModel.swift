//
//  GameViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 21/05/24.
//

import SwiftUI

protocol GameViewModelProtocol {
    var generatedGame: GeneratedGame { get }
    var isGameFinished: Bool { get }
    var nextQuestionId: Int { get }
    var rightAnswers: Int { get }
    var shouldDisplayFinishButton: Bool { get }
    var shouldDisplayNextButton: Bool { get }
    var wrongAnswers: Int { get }

    func didAnswer(questionID: Int, answer: String) -> Bool
    func didScrollToNextQuestion()
    func didSelectFinishGame()
}

@Observable final class GameViewModel: GameViewModelProtocol {

    private var answeredQuestions = 0
    let generatedGame: GeneratedGame
    var isGameFinished: Bool = false
    var nextQuestionId: Int = 0
    var rightAnswers = 0
    var wrongAnswers = 0
    var shouldDisplayFinishButton = false
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

        shouldDisplayFinishButton = answeredQuestions == questions.count
        shouldDisplayNextButton = answeredQuestions != questions.count
        nextQuestionId = questionID + 1

        let question = questions[questionID]
        if question?.correctAnswer == answer {
            rightAnswers += 1
        } else {
            wrongAnswers += 1
        }

        return question?.correctAnswer == answer
    }

    func didScrollToNextQuestion() {
        shouldDisplayNextButton = false
    }

    func didSelectFinishGame() {
        isGameFinished = true
    }

}
