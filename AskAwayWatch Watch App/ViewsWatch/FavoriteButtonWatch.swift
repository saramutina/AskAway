//
//  FavoriteButtonWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct FavoriteButtonWatch: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
            modelData.saveData(to: "questions.json")
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .shadow(radius: 2, x: -1, y: 1)
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? Color("favorite") : .gray)
        }
        .frame(width: 20)
        .buttonStyle(.plain)
    }
}

struct FavoriteButtonWatch_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavoriteButtonWatch(isSet: .constant(true))
                .previewDisplayName("Star - favorite")
            FavoriteButtonWatch(isSet: .constant(false))
                .previewDisplayName("Star - not favorite")
        }
        .environmentObject(ModelData())
    }
}
