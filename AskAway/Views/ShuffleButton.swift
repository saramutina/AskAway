//
//  ShuffleButton.swift
//  AskAway
//
//  Created by Katie Saramutina on 04.07.2023.
//

import SwiftUI

struct ShuffleButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("dustyBlue"))
                .shadow(radius: 2, x: -3, y: 3)
            Image(systemName: "shuffle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .foregroundColor(Color.primary)
        }
        .accessibilityLabel("Shuffle questions")
        .frame(height: 100)
        .padding(.horizontal)
    }
}

struct ShuffleButton_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleButton()
    }
}
