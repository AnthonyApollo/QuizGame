//
//  QuizGameApp.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/10/23.
//

import SwiftData
import SwiftUI

@main
struct QuizGameApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: PreviousGame.self)
    }
}
