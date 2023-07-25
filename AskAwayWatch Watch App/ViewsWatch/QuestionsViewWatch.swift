//
//  QuestionsViewWatch.swift
//  AskAwayWatch Watch App
//
//  Created by Katie Saramutina on 21.07.2023.
//

import SwiftUI

struct QuestionsViewWatch: View {
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
    
    var question: Question {
        if questions.indices.contains(currentQuestionIndex) {
            return questions[currentQuestionIndex]
        } else {
            let newIndex = questions.count - 1
            return questions[newIndex]
        }
    }
    
    func changeToNextQuestion() {
        currentQuestionIndex = currentQuestionIndex + 1 < questions.count ? currentQuestionIndex + 1 : 0
    }

    func changeToPreviousQuestion() {
        if currentQuestionIndex + 1 > questions.count {
            currentQuestionIndex = questions.count - 1
        }
        currentQuestionIndex = currentQuestionIndex - 1 >= 0 ? currentQuestionIndex - 1 : questions.count - 1
    }

    
    var body: some View {
        if !questions.isEmpty {
            VStack {
                QuestionBubbbleViewWatch(question: question)
                HStack {
                    Button {
                        changeToPreviousQuestion()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .accessibilityLabel("Previous question")
                    .padding(.trailing, 10)
                    QuestionsCountTextView
                    Button {
                        changeToNextQuestion()
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                    .accessibilityLabel("Previous question")
                    .padding(.leading, 10)
                }
                .foregroundColor(Color.primary)
                .frame(height: 5)
                .padding(5)
                .buttonStyle(.plain)
            }
        } else {
            EmptyView()
        }
    }
    
    private var QuestionsCountTextView: some View {
        if questions.indices.contains(currentQuestionIndex) {
            return Text("\(currentQuestionIndex + 1) / \(questions.count)")
        } else {
            let newIndex = questions.count
            return Text("\(newIndex) / \(questions.count)")
        }
    }
}

struct QuestionsViewWatch_Previews: PreviewProvider {
    
    static var previews: some View {
        QuestionsViewWatch(categoryName: "Date")
            .environmentObject(ModelData())
    }
}
