//
//  PreviousGamesView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 26/05/24.
//

import SwiftData
import SwiftUI

struct PreviousGamesView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var previousGames: [PreviousGame]

    var body: some View {
        if previousGames.isEmpty {
            Text("You haven't finished a game yet")
        } else {
            List {
                ForEach(previousGames) { previousGame in
                    Text(previousGame.theme)
                }
                .onDelete(perform: deleteItems)
            }
        }
    }

    func deleteItems(indexes: IndexSet) {
        for index in indexes {
            try? modelContext.delete(previousGames[index])
        }
    }
}

#Preview {
    PreviousGamesView()
}
