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
    
    var body: some View {
        NavigationView {
            Group {
                if let game = viewModel.generatedGame {
                    GameView(generatedGame: game)
                } else {
                    NewGameView(viewModel: viewModel)
                }
            }
            .toolbar {
                ConfigToolbarItem {
                    shouldPresentConfigSheet.toggle()
                }
            }
        }
        .sheet(isPresented: $shouldPresentConfigSheet) {
            // TODO: Implement config sheet
            Text("TODO: Implement config sheet")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
