//
//  QuestionsView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct QuestionsView: View {
    var category: Category
    @State private var currentQuestionIndex = 0
    
    func changeToNextQuestion() {
        currentQuestionIndex = currentQuestionIndex + 1 < category.questions.count ? currentQuestionIndex + 1 : 0
    }
    
    func changeToPreviousQuestion() {
        currentQuestionIndex = currentQuestionIndex - 1 >= 0 ? currentQuestionIndex - 1 : category.questions.count - 1
    }
    
    var body: some View {
        VStack {
            Spacer()
            QuestionBubbbleView(category: category, question: category.questions[currentQuestionIndex])
            
            Spacer()
            
            HStack {
                Button {
                    changeToPreviousQuestion()
                } label: {
                    Image(systemName: "arrow.left")
                }
                .padding(.trailing, 40)
                Button {
                    changeToNextQuestion()
                } label: {
                    Image(systemName: "arrow.right")
                }
                .padding(.leading, 40)
            }
            .padding(.bottom)

        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(category: ModelData().categories[0])
    }
}
