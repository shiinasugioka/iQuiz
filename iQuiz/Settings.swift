//
//  Settings.swift
//  iQuiz
//
//  Created by Shiina on 5/9/24.
//

import SwiftUI

struct Settings: View {
    @State private var jsonURL = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Enter URL to quiz data")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 30)
            
            TextField("Enter URL here", text: $jsonURL)
                .padding(.bottom, 30)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Check Now") {
                downloadData()
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid URL"), message: Text("Please enter a valid URL"), dismissButton: .default(Text("OK")))
            }
            
        }
        .padding(40)
        .navigationTitle("Settings")
    }
    
    private func downloadData() {
        guard let url = URL(string: jsonURL) else {
            showAlert = true
            return
        }
    }
}

#Preview {
    Settings()
}
