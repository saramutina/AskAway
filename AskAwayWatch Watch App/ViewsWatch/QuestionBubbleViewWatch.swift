//
//  QuestionBubbleViewWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct QuestionBubbbleViewWatch: View {
    @EnvironmentObject var modelData: ModelData
    var question: Question
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(question.category.color)
                    .shadow(radius: 2, x: -3, y: 3)
                VStack(alignment: .center) {
                    HStack {
                        Text(question.category.rawValue)
                            .font(.footnote)
                        Spacer()
                        FavoriteButtonWatch(isSet: $modelData.questions.first(where: { $0.id == question.id})!.isFavorite)
                    }
                    .frame(height: 20)
                    .padding(.bottom, 5)
                    .opacity(0.7)
                    Text(question.text)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .foregroundColor(Color("primary"))
            .padding()
        }
    }
}

struct QuestionBubbleViewWatch_Previews: PreviewProvider {
    static var previews: some View {
        QuestionBubbbleViewWatch( question: ModelData().questions[0])
            .environmentObject(ModelData())
    }
}
