//
//  Question.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import Foundation

struct Question: Identifiable, Codable {
    var id: Int
    var text: String
    var isFavorite: Bool
}
