//
//  HomeView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = NewGameViewModel()
    @State private var shouldPresentConfigSheet = false
    @State private var navigationPath: [String] = []
    @Environment(\.colorScheme) private var colorScheme
    @State private var alteredColorScheme: ColorScheme?

    var body: some View {
        TabView {
            NavigationStack {
                NewGameView(viewModel: viewModel)
                    .toolbar {
                        ConfigToolbarItem {
                            shouldPresentConfigSheet.toggle()
                        }
                    }
                    .sheet(isPresented: $shouldPresentConfigSheet) {
                        SettingsView(
                            colorScheme: Binding(
                                get: { colorScheme },
                                set: { alteredColorScheme = $0 }
                            ),
                            gptModel: $viewModel.gptModel,
                            numberOfQuestions: $viewModel.numberOfQuestions
                        )
                }
            }
            .tabItem {
                Label("New Game", systemImage: "arcade.stick.console")
            }

            PreviousGamesView()
                .tabItem {
                    Label("Previous Games", systemImage: "clock.arrow.2.circlepath")
                }
        }
        .preferredColorScheme(alteredColorScheme ?? colorScheme)
    }
}

#Preview {
    HomeView()
}
