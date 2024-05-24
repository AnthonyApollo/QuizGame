//
//  GameViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 21/05/24.
//

import SwiftUI

protocol GameViewModelProtocol: ObservableObject {
    var generatedGame: GeneratedGame { get }
    var nextQuestionId: Int { get }
    var shouldDisplayNextButton: Bool { get }

    func didAnswer(questionID: Int, answer: String) -> Bool
    func didScrollToNextQuestion()
}

final class GameViewModel: GameViewModelProtocol {

    let generatedGame: GeneratedGame
    var nextQuestionId: Int = 0
    @Published var shouldDisplayNextButton = false
    private var rightAnswers = 0
    private var answeredQuestions = 0

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
