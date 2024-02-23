//
//  ColorScheme+Settings.swift
//  QuizGame
//
//  Created by Anthony Apollo on 23/02/24.
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

    var iconSystemName: String {
        switch self {
        case .light:
            return "sun.max"
        case .dark:
            return "moon"
        @unknown default:
            return ""
        }
    }

}
