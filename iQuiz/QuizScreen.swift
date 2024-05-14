//
//  QuizScreen.swift
//  iQuiz
//
//  Created by Shiina on 5/9/24.
//

import SwiftUI

struct QuizScreen: View {
    
    let category: Category
    let currentQuestionIndex: Int
    let correctAnswers: Int
    @State private var selectedAnswerIndex: Int = -1
    
    init(category: Category, currentQuestionIndex: Int, correctAnswers: Int) {
        self.category = category
        self.currentQuestionIndex = currentQuestionIndex
        self.correctAnswers = correctAnswers
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(category.questions[currentQuestionIndex].text)
                    .font(.title)
                
                ForEach(0..<category.questions[currentQuestionIndex].answers.count, id: \.self) { index in
                    Button(action: {
                        selectedAnswerIndex = index
                    }) {
                        Text(category.questions[currentQuestionIndex].answers[index])
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(selectedAnswerIndex == index ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .font(.system(size: 27))
                    }
                    .padding(.horizontal, 40)
                }
                
                NavigationLink(
                    destination:
                        AnswerCheckScreen(
                            question: category.questions[currentQuestionIndex],
                            selectedAnswerIndex: selectedAnswerIndex,
                            currentQuestionIndex: currentQuestionIndex,
                            category: category,
                            correctAnswers: correctAnswers
                        )) {
                            Text("Submit")
                        }
                        .disabled(selectedAnswerIndex == -1)
            }
            .padding()
            .navigationBarTitle("Question \(currentQuestionIndex + 1)")
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    QuizScreen(
        category:
            Category(
                title: "Mathematics",
                desc: "Take a simple math quiz.",
                questions: [
                    Question(text: "What is 10 + 7?", answer: "1", answers: ["17", "20", "3", "15"]),
                    Question(text: "What is 5 * 3?", answer: "4", answers: ["179", "10", "2321", "15"]),
                    Question(text: "What is the value of pi rounded?", answer: "2", answers: ["3.18", "3.14", "3.20", "3.15"])
                ]),
        currentQuestionIndex: 0,
        correctAnswers: 0
    )
}
