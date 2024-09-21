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
    @State var viewModel = PreviousGamesViewModel()

    var body: some View {
        NavigationStack {
            if previousGames.isEmpty {
                Text("You haven't finished a game yet")
            } else {
                List {
                    ForEach(viewModel.dates, id: \.description) { date in
                        Section(date) {
                            ForEach(viewModel.organizedPreviousGames[date]!) { previousGame in
                                Text(previousGame.theme)
                            }
                            .onDelete(perform: deleteItems)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.previousGames = previousGames
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
