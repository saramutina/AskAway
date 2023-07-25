//
//  AskAwayApp.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

@main
struct AskAwayApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(modelData)
        }
    }
}
