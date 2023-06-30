//
//  Category.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import Foundation

struct Category: Identifiable, Codable {
    var id: Int
    var title: String
    var questions: [Question]
    var theme: Theme
    var image: String
}
