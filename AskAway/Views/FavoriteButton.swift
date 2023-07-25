//
//  FavoriteButton.swift
//  AskAway
//
//  Created by Katie Saramutina on 30.06.2023.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
            modelData.save(modelData.questions, filename: "questions.json")
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .shadow(radius: 2, x: -1, y: 1)
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? Color("favorite") : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavoriteButton(isSet: .constant(true))
                .previewDisplayName("Star - favorite")
            FavoriteButton(isSet: .constant(false))
                .previewDisplayName("Star - not favorite")
        }
        .environmentObject(ModelData())
    }
}
