//
//  Category.swift
//  AskAway
//
//  Created by Katie Saramutina on 03.07.2023.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Identifiable {
    case general = "General"
    case date = "Date"
    case deep = "Deep"
    case smallTalk = "Small Talk"
    case yesOrNo = "Yes or No"
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
    
    var id: Int {
        switch self {
        case .general:
            return 1
        case .date:
            return 2
        case .deep:
            return 3
        case .smallTalk:
            return 4
        case .yesOrNo:
            return 5
        case .favorites:
            return 100
        }
    }
}
