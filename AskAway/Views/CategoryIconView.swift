//
//  CategoryIconView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct CategoryIconView: View {
    var categoryName: String
    var category: Category {
        Category(rawValue: categoryName)!
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(category.color)
            VStack {
                Spacer()
                Image(systemName: category.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .foregroundColor(Color.primary)
                Spacer()
                Text(category.rawValue)
                    .padding()
            }
            .foregroundColor(Color.primary)
        }
        .frame(height: 150)
    }
}

struct CategoryIconView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconView(categoryName: ModelData().questions[0].category.rawValue)
    }
}
