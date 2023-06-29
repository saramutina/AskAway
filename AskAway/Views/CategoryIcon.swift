//
//  CategoryIcon.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct CategoryIcon: View {
    var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(category.theme.mainColor)
            Image(systemName: category.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .foregroundColor(Color.primary)
        }
    }
}

struct CategoryIcon_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIcon(category: ModelData().categories[0])
    }
}
