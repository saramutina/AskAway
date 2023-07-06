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
                    .onDisappear {
                        modelData.shuffledQuestions = []
                    }
            }, label: {
                ShuffleButton()
            })
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(modelData.categoriesDictionary.sorted(by: {$0.key.id < $1.key.id}), id: \.key) { category, questions in
                    if !modelData.questions(for: category.rawValue).isEmpty {
                        NavigationLink(destination: {
                            QuestionsView(categoryName: category.rawValue)
                        }, label: {
                            CategoryIconView(categoryName: category.rawValue)
                        })
                    }
                }
                if !modelData.favoriteQuestions.isEmpty {
                    NavigationLink(destination: {
                        QuestionsView(categoryName: "Favorites")
                    }, label: {
                        CategoryIconView(categoryName: "Favorites")
                    })
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
