//
//  QuestionBubbbleView.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

struct QuestionBubbbleView: View {
    var category: Category
    var question: Question
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(category.theme.mainColor)
            VStack(alignment: .leading) {
                Text(category.title.rawValue)
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
    }
}
