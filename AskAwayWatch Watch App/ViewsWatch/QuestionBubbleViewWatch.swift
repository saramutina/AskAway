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
    @Binding var isFavorite: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(question.category.color)
                    .shadow(radius: 2, x: -3, y: 3)
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: question.category.imageName)
                            .opacity(0.6)
                        Text(NSLocalizedString(question.category.rawValue, comment: "category name"))
                            .font(.caption2)
                            .multilineTextAlignment(.leading)
                            .opacity(0.6)
                        Spacer()
                        FavoriteButtonWatch(isSet: $isFavorite)
                    }
                    .frame(height: 20)
                    .padding(.bottom, 5)
                    .opacity(0.7)
                    Text(NSLocalizedString(question.text, comment: "question text"))
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
        QuestionBubbbleViewWatch( question: ModelData().questions[0], isFavorite: .constant(false))
            .environmentObject(ModelData())
    }
}
