//
//  SettingsView.swift
//  QuizGame
//
//  Created by Anthony Apollo on 14/02/24.
//

import SwiftUI

struct SettingsView: View {

    enum ColorScheme: String, CaseIterable {
        case system
        case light
        case dark
    }

    @State private var numberOfQuestions = 5
    @State private var gptModel: GPTModel = .gpt4
    @State private var colorScheme: ColorScheme = .system

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
                    Picker("Color scheme", systemImage: "sun.max", selection: $colorScheme) {
                        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                            Text(colorScheme.rawValue.capitalized)
                        }
                    }
                    .foregroundStyle(.primary)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
