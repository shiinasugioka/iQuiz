//
//  QuizScreen.swift
//  iQuiz
//
//  Created by stlp on 5/9/24.
//

import SwiftUI

struct QuizScreen: View {
    
    let category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    var body: some View {
        Text("Quiz screen for \(category.name)")
    }
}

#Preview {
    QuizScreen(
        category:
                Category(
                    name: "Mathematics",
                    description: "Take a simple math quiz.",
                    icon: "x.squareroot"
                )
    )
}
