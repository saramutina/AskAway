//
//  Theme.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import Foundation
import SwiftUI

enum Theme: String, Codable {
    case aqua
    case green
    case orange
    case peach
    case purple
    
    var mainColor: Color {
        Color(rawValue)
    }
}
