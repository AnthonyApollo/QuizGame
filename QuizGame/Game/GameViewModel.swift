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

    let generatedGame: GeneratedGame
    let repository: GameRepositoryProtocol

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

    private var answeredQuestions: [AnsweredQuestion] = []

    init(
        generatedGame: GeneratedGame,
        repository: GameRepositoryProtocol
    ) {
        self.generatedGame = generatedGame
        self.repository = repository
    }

    func didAnswer(questionID: Int, answer: String) -> Bool {
        guard let question = questions[questionID] else {
            return false
        }

        let isRightAnswer = question.correctAnswer == answer
        if isRightAnswer {
            rightAnswers += 1
        } else {
            wrongAnswers += 1
        }

        answeredQuestions.append(.init(generatedQuestion: question, selectedAnswer: answer))

        nextQuestionId = questionID + 1
        shouldDisplayFinishButton = answeredQuestions.count == questions.count
        shouldDisplayNextButton = answeredQuestions.count != questions.count

        return isRightAnswer
    }

    func didScrollToNextQuestion() {
        shouldDisplayNextButton = false
    }

    func didSelectFinishGame() {
        isGameFinished = true

        let playedGame = PreviousGame(theme: generatedGame.theme,
                                      rightAnswers: rightAnswers,
                                      wrongAnswers: wrongAnswers,
                                      questions: answeredQuestions)

        repository.save(game: playedGame)
    }

}
