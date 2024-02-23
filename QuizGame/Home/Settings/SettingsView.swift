//
//  SettingsView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 14/02/24.
//

import SwiftUI

struct SettingsView: View {

    @Binding var colorScheme: ColorScheme
    @Binding var gptModel: GPTModel
    @Binding var numberOfQuestions: Int

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
    SettingsView(colorScheme: .constant(.light), gptModel: .constant(.gpt3), numberOfQuestions: .constant(5))
}
