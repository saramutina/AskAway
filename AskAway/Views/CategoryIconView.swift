//
//  CategoryIconView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct CategoryIconView: View {
    var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(category.theme.mainColor)
            VStack {
                Spacer()
                Image(systemName: category.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .foregroundColor(Color.primary)
                Spacer()
                Text(category.title)
                    .padding()
            }
            .foregroundColor(Color.primary)
        }
        .frame(height: 150)
    }
}

struct CategoryIconView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconView(category: ModelData().categories[0])
    }
}
