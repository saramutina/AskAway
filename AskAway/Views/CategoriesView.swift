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
            NavigationLink(destination: {
                QuestionsView(categoryName: "all")
            }, label: {
                ShuffleButton()
            })
            LazyVGrid(columns: columns, spacing: 8) {
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
            .padding(.horizontal)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(ModelData())
    }
}
