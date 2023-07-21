//
//  CategoryIconViewWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct CategoryIconViewWatch: View {
    var categoryName: String
    var category: Category {
        Category(rawValue: categoryName)!
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(category.color)
                .shadow(radius: 2, x: -3, y: 3)
            HStack {
                Image(systemName: category.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Spacer()
                Text(category.rawValue)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(7)
            }
            .foregroundColor(Color("primary"))
        }
        .frame(height: 70)
    }
}

struct CategoryIconViewWatch_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconViewWatch(categoryName: ModelData().questions[0].category.rawValue)
    }
}
