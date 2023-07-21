//
//  ContentViewWatchApp.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct ContentViewWatch: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            CategoriesViewWatch()
                .foregroundColor(Color("primary"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWatch()
            .environmentObject(ModelData())
    }
}
