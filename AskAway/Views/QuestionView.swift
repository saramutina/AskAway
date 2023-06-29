//
//  QuestionView.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

struct QuestionView: View {
    var question: Question
    
    var body: some View {
        Text(question.text)
            .font(.title)
            .multilineTextAlignment(.center)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: ModelData().categories[0].questions[0])
    }
}
