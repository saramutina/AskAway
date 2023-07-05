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
                .fill(Color(.gray))
            Image(systemName: "shuffle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .foregroundColor(Color.primary)
        }
        .frame(height: 100)
        .padding(.horizontal)
    }
}

struct ShuffleButton_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleButton()
    }
}
