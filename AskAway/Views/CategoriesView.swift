//
//  CategoriesView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var modelData: ModelData
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(modelData.categoriesDictionary.keys.sorted(), id: \.self) { categoryName in
                    if !modelData.questions(for: categoryName).isEmpty {
                        NavigationLink(destination: {
                            QuestionsView(categoryName: categoryName)
                        }, label: {
                            CategoryIconView(categoryName: categoryName)
                        })
                    }
                }
            }
            .padding()
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(ModelData())
    }
}
