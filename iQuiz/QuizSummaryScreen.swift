//
//  QuizSummaryScreen.swift
//  iQuiz
//
//  Created by Shiina on 5/13/24.
//

import SwiftUI

struct QuizSummaryScreen: View {
    let correctAnswers: Int
    let category: Category
    
    var resultMessage: String {
        let totalQuestions = category.questions.count
        
        switch correctAnswers {
        case totalQuestions:
            return "Perfect!"
        case totalQuestions - 1:
            return "Almost there!"
        case 0:
            return "You should study more"
        default:
            return "Keep practicing!"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Correct Answers: \(correctAnswers)/\(category.questions.count)")
                    .font(.title)
                Text(resultMessage)
                    .font(.headline)
                
                NavigationLink(destination: ContentView()) {
                    Text("Home")
                        .foregroundColor(.orange)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 40)
            .navigationTitle("Quiz Summary")
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    QuizSummaryScreen(
        correctAnswers: 3,
        category: Category(
            title: "Mathematics",
            desc: "Take a simple math quiz.",
            questions: [
                Question(text: "What is 10 + 7?", answer: "1", answers: ["17", "20", "3", "15"]),
                Question(text: "What is 5 * 3?", answer: "4", answers: ["179", "10", "2321", "15"]),
                Question(text: "What is the value of pi rounded?", answer: "2", answers: ["3.18", "3.14", "3.20", "3.15"])
            ])
    )
}
