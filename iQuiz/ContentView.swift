//
//  ContentView.swift
//  iQuiz
//
//  Created by Shiina on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    
    let categories: [Category] = [
        Category(name: "Mathematics", description: "Take a simple math quiz.", icon: "x.squareroot"),
        Category(name: "Marvel Super Heroes", description: "How much do you know about heroes?", icon: "figure.archery"),
        Category(name: "Science", description: "Test your science knowledge.", icon: "atom")
    ]
    
    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: QuizScreen(category: category)) {
                    HStack {
                        Image(systemName: category.icon)
                            .padding(.trailing, 10)
                            .font(.system(size: 30))
                            .foregroundStyle(Color(.green))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(category.name)
                                .font(.system(size: 20))
                                
                            Text(category.description)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: Settings()) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 25))
                            .padding(10)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
