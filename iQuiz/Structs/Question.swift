//
//  Question.swift
//  iQuiz
//
//  Created by stlp on 5/13/24.
//

struct Question: Codable, Hashable {
    let text: String
    let answer: String
    let answers: [String]  // array is index by 1
}
