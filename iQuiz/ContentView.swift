//
//  ContentView.swift
//  iQuiz
//
//  Created by Shiina on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var categories: [Category] = []
    
    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: QuizScreen(category: category)) {
                    HStack {
                        Image(systemName: "x.squareroot")
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
    }
}

#Preview {
    ContentView()
}
