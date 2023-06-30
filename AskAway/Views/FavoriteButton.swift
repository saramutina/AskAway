//
//  FavoriteButton.swift
//  AskAway
//
//  Created by Katie Saramutina on 30.06.2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
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
    }
}
