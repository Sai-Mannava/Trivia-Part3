//
//  TriviaOptions.swift
//  Trivia
//
//  Created by Sai Mannava on 3/29/24.
//

import SwiftUI

struct TriviaOptions {
    var amount: Int = 10 // Default number of questions
    var category: String? // Use nil to represent 'Any Category'
    var difficulty: String? // Use nil for 'Any Difficulty', otherwise "easy", "medium", "hard"
    var type: String? // Use nil for 'Any Type', otherwise "multiple", "boolean"
}

