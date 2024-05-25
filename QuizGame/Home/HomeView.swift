//
//  HomeView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = NewGameViewModel()
    @State private var shouldPresentGameSheet = false
    @State private var shouldPresentConfigSheet = false
    @State private var navigationPath: [String] = []
    @Environment(\.colorScheme) private var colorScheme
    @State private var alteredColorScheme: ColorScheme?

    var body: some View {
        NavigationStack {
            NewGameView(viewModel: viewModel) {
                shouldPresentGameSheet.toggle()
            }
            .toolbar {
                ConfigToolbarItem {
                    shouldPresentConfigSheet.toggle()
                }
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
        .sheet(isPresented: $shouldPresentGameSheet) {
            GameView(viewModel: viewModel)
        }
        .preferredColorScheme(alteredColorScheme ?? colorScheme)
    }
}

#Preview {
    HomeView()
}
