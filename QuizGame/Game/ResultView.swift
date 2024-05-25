//
//  ResultView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 25/05/24.
//

import SwiftUI

struct ResultView: View {

    let rightAnswers: Int
    let wrongAnswers: Int

    var body: some View {
        VStack {
            HStack {
                Text("Right answers: \(rightAnswers)")
                Image(systemName: "checkmark")
                    .foregroundStyle(Color.green)
            }
            HStack {
                Text("Wrong answers: \(wrongAnswers)")
                Image(systemName: "xmark")
                    .foregroundStyle(Color.red)
            }
        }
    }
}

#Preview {
    ResultView(rightAnswers: 2, wrongAnswers: 3)
}
