//
//  Category.swift
//  iQuiz
//
//  Created by Shiina on 5/9/24.
//

struct Category: Codable, Hashable {
    let title: String
    let desc: String
//    let icon: String
    let questions: [Question]
}
