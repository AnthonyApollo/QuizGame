//
//  SettingsView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 14/02/24.
//

import SwiftUI

struct SettingsView: View {

    @Binding var numberOfQuestions: Int
    @State private var gptModel: GPTModel = .gpt4
    @Binding var colorScheme: ColorScheme

    var body: some View {
        NavigationStack {
            Form {
                Section("Game") {
                    Picker("Number of questions", selection: $numberOfQuestions) {
                        ForEach(1...10, id: \.self) { n in
                            Text(String(n))
                        }
                    }

                    Picker("GPT Model", selection: $gptModel) {
                        ForEach(GPTModel.allCases, id: \.self) { model in
                            Text(model.rawValue)
                        }
                    }
                }

                Section("App") {
                    Picker("Color scheme", systemImage: colorScheme.iconSystemName, selection: $colorScheme) {
                        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                            Text(colorScheme.title)
                        }
                    }
                    .foregroundStyle(.primary)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(colorScheme)
        }
    }

}

#Preview {
    SettingsView(numberOfQuestions: .constant(5), colorScheme: .constant(.light))
}
