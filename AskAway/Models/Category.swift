//
//  Category.swift
//  AskAway
//
//  Created by Katie Saramutina on 03.07.2023.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Identifiable {
    case gettingToKnow = "Getting to Know You"
    case deep = "Deep"
    case couples = "Couples"
    case groupOfFriends = "Group of Friends"
    case neverHaveIEver = "Never Have I Ever"
    case favorites = "Favorites"
    
    var color: Color {
        switch self {
        case .gettingToKnow:
            return Color("orange")
        case .deep:
            return Color("purple")
        case .couples:
            return Color("peach")
        case .groupOfFriends:
            return Color("green")
        case .neverHaveIEver:
            return Color("aqua")
        case .favorites:
            return Color(.systemYellow)
        }
    }
    
    var imageName: String {
        switch self {
        case .gettingToKnow:
            return "person.line.dotted.person.fill"
        case .deep:
            return "brain.head.profile"
        case .couples:
            return "heart"
        case .groupOfFriends:
            return "cloud.sun.rain"
        case .neverHaveIEver:
            return "plus.forwardslash.minus"
        case .favorites:
            return "star.fill"
        }
    }
    
    var id: Int {
        switch self {
        case .gettingToKnow:
            return 1
        case .deep:
            return 2
        case .couples:
            return 3
        case .groupOfFriends:
            return 4
        case .neverHaveIEver:
            return 5
        case .favorites:
            return 100
        }
    }
}
