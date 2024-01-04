//
//  HomeView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/10/23.
//

import SwiftUI

struct HomeView: View {
    @State var shouldPresentConfigSheet = false

    var body: some View {
        NavigationView {
            NewGameView()
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
