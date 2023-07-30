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
                    .frame(width: 50, height: 50)
                Spacer()
                Text(NSLocalizedString(category.rawValue, comment: "category name"))
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(7)
                    .frame(maxHeight: .infinity)
            }
            .foregroundColor(Color("primary"))
        }
        .accessibilityLabel("\(categoryName) questions category")
        .frame(maxHeight: .infinity)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct CategoryIconViewWatch_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconViewWatch(categoryName: ModelData().questions[0].category.rawValue)
    }
}
