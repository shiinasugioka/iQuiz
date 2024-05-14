//
//  AnswerCheckScreen.swift
//  iQuiz
//
//  Created by Shiina on 5/13/24.
//

import SwiftUI

struct AnswerCheckScreen: View {
    let question: Question
    let selectedAnswerIndex: Int?
    let currentQuestionIndex: Int
    let category: Category
    let correctAnswers: Int
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(question.text)
                    .font(.title)
                    .fontWeight(.bold)
                
                if let selectedAnswerIndex = selectedAnswerIndex {
                    if selectedAnswerIndex + 1 == Int(question.answer) {
                        Text("Correct!")
                            .foregroundColor(.green)
                            .font(.headline)
                    } else {
                        Text("Wrong!")
                            .foregroundColor(.red)
                            .font(.headline)
                    }
                } else {
                    Text("No answer selected")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                
                if let selectedAnswerIndex = selectedAnswerIndex {
                    if currentQuestionIndex < category.questions.count - 1 {
                        NavigationLink(destination:
                                        QuizScreen(
                                            category: category,
                                            currentQuestionIndex: currentQuestionIndex + 1,
                                            correctAnswers: selectedAnswerIndex + 1 == Int(question.answer) ? correctAnswers + 1 : correctAnswers
                                        )) {
                                            Text("Next")
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                        }
                    } else {
                        NavigationLink(
                            destination: QuizSummaryScreen(
                                correctAnswers: correctAnswers,
                                category: category
                            )) {
                                Text("Finish")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                    }
                } else {
                    NavigationLink(destination:
                                    QuizScreen(
                                        category: category,
                                        currentQuestionIndex: currentQuestionIndex + 1,
                                        correctAnswers: correctAnswers
                                    )) {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    }
                }
            }
            .padding()
            .navigationBarTitle("Question \(currentQuestionIndex + 1)")
        }
        .navigationBarBackButtonHidden(true)
    }
}
