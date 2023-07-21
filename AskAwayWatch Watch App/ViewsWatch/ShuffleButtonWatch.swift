//
//  ShuffleButtonWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct ShuffleButtonWatch: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color("dustyBlue"))
                .shadow(radius: 2, x: -3, y: 3)
            HStack {
                Image(systemName: "shuffle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 50, height: 50)
                Spacer()
                Text("Shuffle")
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(7)
                    .frame(maxHeight: .infinity)
            }
            .foregroundColor(Color("primary"))
        }
        .frame(maxHeight: .infinity)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ShuffleButtonWatch_Previews: PreviewProvider {
    static var previews: some View {
        ShuffleButtonWatch()
    }
}
