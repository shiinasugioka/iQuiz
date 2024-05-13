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
        Text("Quiz screen for \(category.title)")
    }
}

#Preview {
    QuizScreen(
        category:
                Category(
                    title: "Mathematics",
                    desc: "Take a simple math quiz.",
                    questions: []
                )
    )
}
