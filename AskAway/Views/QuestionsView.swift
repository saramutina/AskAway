//
//  QuestionsView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var modelData: ModelData
    var categoryName: String
    
    @State private var currentQuestionIndex: Int = 0
    
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
    
    func changeToNextQuestion() {
        currentQuestionIndex = currentQuestionIndex + 1 < questions.count ? currentQuestionIndex + 1 : 0
    }

    func changeToPreviousQuestion() {
        currentQuestionIndex = currentQuestionIndex - 1 >= 0 ? currentQuestionIndex - 1 : questions.count - 1
    }
    
    var body: some View {
        if !questions.isEmpty {
            VStack {
                Spacer()

                    QuestionBubbbleView(question: questions[currentQuestionIndex])
                
                Spacer()
                
                HStack {
                    Button {
                        changeToPreviousQuestion()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .padding(.trailing, 40)
                    Text("\(currentQuestionIndex + 1) / \(questions.count)")
                    Button {
                        changeToNextQuestion()
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                    .padding(.leading, 40)
                }
                .padding(.bottom)

            }
        } else {
            EmptyView()
        }
    }

}

struct QuestionsView_Previews: PreviewProvider {
    
    static var previews: some View {
        QuestionsView(categoryName: "Date")
            .environmentObject(ModelData())
    }
}
