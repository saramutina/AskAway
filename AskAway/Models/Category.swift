//
//  Category.swift
//  AskAway
//
//  Created by Katie Saramutina on 03.07.2023.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable {
    case general = "General"
    case date = "Date"
    case yesOrNo = "Yes or No"
    case smallTalk = "Small Talk"
    case deep = "Deep"
    case favorites = "Favorites"
    
    var color: Color {
        switch self {
        case .general:
            return Color("orange")
        case .date:
            return Color("peach")
        case .deep:
            return Color("purple")
        case .smallTalk:
            return Color("green")
        case .yesOrNo:
            return Color("aqua")
        case .favorites:
            return Color(.systemYellow)
        }
    }
    
    var imageName: String {
        switch self {
        case .general:
            return "person.line.dotted.person.fill"
        case .date:
            return "heart"
        case .deep:
            return "brain.head.profile"
        case .smallTalk:
            return "cloud.sun.rain"
        case .yesOrNo:
            return "plus.forwardslash.minus"
        case .favorites:
            return "star.fill"
        }
    }
}
