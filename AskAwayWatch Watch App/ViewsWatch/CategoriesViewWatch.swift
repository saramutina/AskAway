//
//  CategoriesViewWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct CategoriesViewWatch: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView {
            NavigationLink(destination: {
                QuestionsViewWatch(categoryName: "all")
                    .onDisappear {
                        modelData.shuffledQuestions = []
                    }
            }, label: {
                ShuffleButtonWatch()
            })
            .padding(.bottom, 5)
            .padding(.horizontal, 5)
            VStack {
                ForEach(modelData.categoriesDictionary.sorted(by: {$0.key.id < $1.key.id}), id: \.key) { category, questions in
                    if !modelData.questions(for: category.rawValue).isEmpty {
                        NavigationLink(destination: {
                            QuestionsViewWatch(categoryName: category.rawValue)
                        }, label: {
                            CategoryIconViewWatch(categoryName: category.rawValue)
                        })
                        .padding(.bottom, 5)
                        .padding(.horizontal, 5)
                    }
                }
                if !modelData.favoriteQuestions.isEmpty {
                    NavigationLink(destination: {
                        QuestionsViewWatch(categoryName: "Favorites")
                    }, label: {
                        CategoryIconViewWatch(categoryName: "Favorites")
                    })
                    .padding(.bottom, 5)
                    .padding(.horizontal, 5)
                }
            }
        }
        .padding(.horizontal)
        .buttonStyle(.borderless)
    }
}

struct CategoriesViewWatch_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesViewWatch()
            .environmentObject(ModelData())
    }
}
