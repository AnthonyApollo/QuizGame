//
//  GenerationErrorView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 30/03/24.
//

import SwiftUI

struct GenerationErrorView: View {
    var errorMessage: String

    var body: some View {
        Text(errorMessage)
            .font(.title)
            .bold()
    }
}

#Preview {
    GenerationErrorView(errorMessage: "Error generating game")
}
