//
//  QuestionsViewWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI
import UIKit

struct QuestionsViewWatch: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.colorScheme) var colorScheme
    var categoryName: String
    
    
    var questions: [Question] {
        if categoryName == "all" {
            if modelData.shuffledQuestions.count == 0 {
                modelData.shuffleQuestions()
            }
            return modelData.shuffledQuestions
        } else if categoryName == "Favorites" {
            return modelData.favoriteQuestions
        } else {
            return modelData.questions(for: categoryName)
        }
    }
    
    var body: some View {
        if !questions.isEmpty {
            TabView {
                ForEach(questions) {question in
                    VStack{
                        QuestionBubbbleViewWatch(question: question, isFavorite: $modelData.questions.first(where: { $0.id == question.id})!.isFavorite)
                        Text("\(questions.firstIndex(of: question)! + 1) / \(questions.count)")
                            .opacity(0.5)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(.page)
            .background(Color("background"))
        } else {
            EmptyView()
        }
    }
}

struct QuestionsViewWatch_Previews: PreviewProvider {
    
    static var previews: some View {
        QuestionsViewWatch(categoryName: "Date")
            .environmentObject(ModelData())
    }
}
