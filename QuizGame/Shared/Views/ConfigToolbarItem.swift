//
//  ConfigToolbarItem.swift
//  QuizGame
//
//  Created by Anthony Apollo on 03/01/24.
//

import SwiftUI

struct ConfigToolbarItem: ToolbarContent {

    var placement: ToolbarItemPlacement = .navigationBarTrailing
    var action: (() -> Void)?

    var body: some ToolbarContent {
        ToolbarItem(placement: placement) {
            Button {
                action?()
            } label: {
                Image(systemName: "gearshape")
                    .foregroundColor(.primary)
            }
        }
    }
}

struct ConfigToolbarItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Button preview")
                .foregroundColor(.gray)
                .toolbar {
                    ConfigToolbarItem {
                        print("Action triggered")
                    }
                }
        }
    }
}
