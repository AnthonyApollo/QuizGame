//
//  Game.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import Foundation

struct GeneratedGame: Decodable, Equatable {
    let theme: String
    let questions: [GeneratedQuestion]
}

struct GeneratedQuestion: Decodable, Identifiable, Equatable {
    let id: Int
    let topic: String
    let question: String
    let answers: [String]
    let correctAnswer: String
}
