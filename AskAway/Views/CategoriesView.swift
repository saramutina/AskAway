//
//  CategoriesView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [Category]
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(categories) { category in
                    NavigationLink(destination: {
                        QuestionsView(category: category)
                    }, label: {
                        CategoryIcon(category: category)
                            .frame(height: 150)
                    })
                }
            }
            .padding()
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: ModelData().categories)
    }
}
