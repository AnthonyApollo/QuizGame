//
//  Game.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/10/23.
//

import Foundation

struct GeneratedGame: Decodable {
    let theme: String
    let questions: [GeneratedQuestion]
}

struct GeneratedQuestion: Decodable, Identifiable {
    let id: Int
    let topic: String
    let question: String
    let answers: [String]
    let correctAnswer: Int
}
