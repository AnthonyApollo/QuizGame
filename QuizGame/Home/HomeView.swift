//
//  HomeView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = NewGameViewModel()
    @State var shouldPresentConfigSheet = false
    @State private var navigationPath: [String] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            NewGameView() {
                navigationPath.append("game")
            }
            .toolbar {
                ConfigToolbarItem {
                    shouldPresentConfigSheet.toggle()
                }
            }
            .navigationDestination(for: String.self) { _ in
                GameView()
            }
        }
        .sheet(isPresented: $shouldPresentConfigSheet) {
            SettingsView()
        }
        .environmentObject(viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
