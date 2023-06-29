//
//  ContentView.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            CategoriesView(categories: modelData.categories)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
