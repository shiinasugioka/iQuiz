//
//  ContentView.swift
//  iQuiz
//
//  Created by Shiina on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var categories: [Category] = []
    
    private var defaultCategories: [Category] = [
        Category(
            title: "Mathematics",
            desc: "Take a simple math quiz.",
            questions: [
                Question(
                    text: "What is 10 + 7?",
                    answer: "1",
                    answers: ["17", "20", "3", "15"]
                ),
                Question(
                    text: "What is 5 * 3?",
                    answer: "4",
                    answers: ["179", "10", "2321", "15"]
                ),
                Question(
                    text: "What is the value of pi rounded?",
                    answer: "2",
                    answers: ["3.18", "3.14", "3.20", "3.15"]
                )
            ]),
        Category(
            title: "Science",
            desc: "Test your science knowledge.",
            questions: [
                Question(
                    text: "What is the chemical symbol for water?",
                    answer: "2",
                    answers: ["Wa", "H2O", "Wa", "O2"]
                )
            ]),
        Category(
            title: "Marvel SuperHeroes",
            desc: "How well do you know the MU?",
            questions: [
                Question(
                    text: "What is the name of the metal alloy used to create Captain America's shield?",
                    answer: "2",
                    answers: ["Adamantium", "Vibranium", "Promethium", "Titanium"]
                )
            ])
    ]
    
    var body: some View {
        NavigationView {
            List(
                categories.isEmpty ? defaultCategories : categories,
                id: \.self
            ) { category in
                NavigationLink(
                    destination: QuizScreen(
                        category: category,
                        currentQuestionIndex: 0,
                        correctAnswers: 0)
                ) {
                    HStack {
                        Image(systemName: "questionmark.bubble.fill")
                            .padding(.trailing, 10)
                            .font(.system(size: 30))
                            .foregroundStyle(Color(.green))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(category.title)
                                .font(.system(size: 20))
                            
                            Text(category.desc)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: Settings(categories: $categories)) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 25))
                            .padding(10)
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
