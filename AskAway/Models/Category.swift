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
    case wouldYouRather = "Would You Rather"
    case neverHaveIEver = "Never Have I Ever"
    case favorites = "Favorites"
    
    var color: Color {
        switch self {
        case .gettingToKnow:
            return Color("green")
        case .deep:
            return Color("purple")
        case .couples:
            return Color("pink")
        case .wouldYouRather:
            return Color("olive")
        case .neverHaveIEver:
            return Color("blue")
        case .favorites:
            return Color("yellow")
        }
    }
    
    var imageName: String {
        switch self {
        case .gettingToKnow:
            return "person.2"
        case .deep:
            return "brain.head.profile"
        case .couples:
            return "heart"
        case .wouldYouRather:
            return "arrow.triangle.2.circlepath.circle"
        case .neverHaveIEver:
            return "hand.raised.slash"
        case .favorites:
            return "star"
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
        case .wouldYouRather:
            return 4
        case .neverHaveIEver:
            return 5
        case .favorites:
            return 100
        }
    }
}
