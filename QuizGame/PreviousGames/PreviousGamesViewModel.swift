//
//  PreviousGamesViewModel.swift
//  QuizGame
//
//  Created by Anthony Apollo on 29/05/24.
//

import Foundation

@Observable
final class PreviousGamesViewModel {

    var previousGames: [PreviousGame] = [] {
        didSet {
            var dates = Set<String>()

            organizedPreviousGames = Dictionary(grouping: previousGames) {
                let formattedDate = $0.date.formatted(date: .numeric, time: .omitted)
                dates.insert(formattedDate)
                return formattedDate
            }

            self.dates = Array(dates)
        }
    }

    var dates: [String] = []

    var organizedPreviousGames: [String: [PreviousGame]] = [:]

}
