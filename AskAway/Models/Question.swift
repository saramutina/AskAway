//
//  Question.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import Foundation
import SwiftUI

struct Question: Identifiable, Codable {
    var id: Int
    var text: String
    var categories: [Category]
    
    enum Category: String, CaseIterable, Identifiable, Codable {
        case general = "General"
        case yesOrNo = "Yes or No"
        case date = "Date"
        
        var id: String { rawValue }
    }
}
