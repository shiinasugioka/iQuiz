//
//  Settings.swift
//  iQuiz
//
//  Created by Shiina on 5/9/24.
//

import SwiftUI

struct Settings: View {
    @State private var jsonURL = ""
    @State private var showUrlAlert = false
    @State private var showNetworkErrorAlert = false
    @Binding var categories: [Category]
    
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
            .alert(isPresented: $showUrlAlert) {
                Alert(title: Text("Invalid URL"), message: Text("Please enter a valid URL"), dismissButton: .default(Text("OK")))
            }
            
        }
        .padding(40)
        .navigationTitle("Settings")
        .alert(isPresented: $showNetworkErrorAlert) {
            Alert(title: Text("Network Error"), message: Text("Please check your internet connection and try again"), dismissButton: .default(Text("OK")))
        }
    }
    
    private func downloadData() {
        guard let url = URL(string: jsonURL) else {
            showUrlAlert = true
            return
        }
        
        print("Getting data from: \(url)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, repsonse, error in
            
            if let error = error {
                print("Error: \(error)")
                showNetworkErrorAlert = true
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let downloadedCategories = try decoder.decode([Category].self, from: data)
                print("Successfully read data: \(downloadedCategories)")
                
                DispatchQueue.main.async {
                    self.categories = downloadedCategories
                }
                
            } catch {
                print("Error decoding JSON data: \(error)")
            }
            
        }
        
        task.resume()
    }
}


