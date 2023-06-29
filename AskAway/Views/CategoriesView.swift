//
//  CategoriesView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [Category]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                HStack {
                    ForEach(categories.prefix(3)) { category in
                        NavigationLink(destination: {
                            QuestionsView(category: category)
                        }, label: {
                            CategoryIcon(category: category)
                        })
                    }
                }
                .padding(.horizontal)
                .frame(height: geometry.size.height *  0.2)
            }
        }
    
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: ModelData().categories)
    }
}
