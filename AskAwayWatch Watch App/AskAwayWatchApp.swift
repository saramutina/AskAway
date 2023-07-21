//
//  AskAwayWatchApp.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

@main
struct AskAwayWatch_Watch_AppApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentViewWatch()
                .environmentObject(modelData)
        }
    }
}
