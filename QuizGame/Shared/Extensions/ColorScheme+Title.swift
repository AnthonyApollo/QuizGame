//
//  ColorScheme+Title.swift
//  QuizGame
//
//  Created by Anthony Apollo on 22/02/24.
//

import SwiftUI

extension ColorScheme {

    var title: String {
        switch self {
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        @unknown default:
            return ""
        }
    }

}
