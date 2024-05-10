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
                NavigationLink(destination: Text("\(category.description)")) {
                    HStack {
                        Image(systemName: category.icon)
                            .padding(.trailing, 10)
                            .font(.system(size: 30))
                            .foregroundStyle(Color(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(category.name)
                                .font(.system(size: 20))
                                
                            Text(category.description)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
            }
            .navigationTitle("iQuiz")
        }
    }
}

struct Category: Hashable {
    let name: String
    let description: String
    let icon: String
}

#Preview {
    ContentView()
}
