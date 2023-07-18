//
//  QuestionBubbbleView.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

struct QuestionBubbbleView: View {
    @EnvironmentObject var modelData: ModelData
    var question: Question
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(question.category.color)
                .shadow(radius: 2, x: -3, y: 3)
            VStack(alignment: .center) {
                HStack {
                    Text(question.category.rawValue)
                    Spacer()
                    FavoriteButton(isSet: $modelData.questions.first(where: { $0.id == question.id})!.isFavorite)
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
        QuestionBubbbleView( question: ModelData().questions[0])
            .environmentObject(ModelData())
    }
}
