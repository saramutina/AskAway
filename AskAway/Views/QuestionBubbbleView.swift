//
//  QuestionBubbbleView.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

struct QuestionBubbbleView: View {
    @EnvironmentObject var modelData: ModelData
    var category: Category
    var question: Question
    
    var categoryIndex: Int {
        return modelData.categories.firstIndex(where: {
            $0.id == category.id
        })!
    }
    
    var questionIndex: Int {
        return modelData.categories[categoryIndex].questions.firstIndex(where: {
            $0.id == question.id
        })!
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(category.theme.mainColor)
            VStack(alignment: .leading) {
                HStack {
                    Text(category.title)
                    Spacer()
                    FavoriteButton(isSet: $modelData.categories[categoryIndex].questions[questionIndex].isFavorite)
                }
                .padding(.bottom, 10)
                Text(question.text)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}

struct QuestionBubbleView_Previews: PreviewProvider {
    
    static var previews: some View {
        QuestionBubbbleView(category: ModelData().categories[0] , question: ModelData().categories[0].questions[0])
            .environmentObject(ModelData())
    }
}
