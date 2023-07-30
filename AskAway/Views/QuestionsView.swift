//
//  QuestionsView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI
import UIKit

struct QuestionsView: View {
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
                            QuestionBubbbleView(question: question, isFavorite: $modelData.questions.first(where: { $0.id == question.id})!.isFavorite)
                            Text("\(questions.firstIndex(of: question)! + 1) / \(questions.count)")
                                .opacity(0.5)
                        }
                    }
                }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = getIndicatorColor(categoryName: categoryName, colorScheme: colorScheme)
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
            }
            .background(Color("background"))
        } else {
            EmptyView()
                .background(Color("background"))
        }
    }
}

private func getIndicatorColor(categoryName: String, colorScheme: ColorScheme) -> UIColor {
    var indicatorColor: UIColor
    if Category(rawValue: categoryName) != nil {
        if colorScheme == .dark {
            indicatorColor = UIColor(Category(rawValue: categoryName)!.color).lighter()
        } else {
            indicatorColor = UIColor(Category(rawValue: categoryName)!.color).darker()
        }
    } else {
        indicatorColor = UIColor(Color.gray)
    }
    return indicatorColor
}

extension UIColor {
    private func makeColor(componentDelta: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Extract r,g,b,a components from the
        // current UIColor
        getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )
        
        // Create a new UIColor modifying each component
        // by componentDelta, making the new UIColor either
        // lighter or darker.
        return UIColor(
            red: add(componentDelta, toComponent: red),
            green: add(componentDelta, toComponent: green),
            blue: add(componentDelta, toComponent: blue),
            alpha: alpha
        )
    }
    
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
            return max(0, min(1, toComponent + value))
        }
    
    func lighter(componentDelta: CGFloat = 0.4) -> UIColor {
        return makeColor(componentDelta: componentDelta)
    }
    
    func darker(componentDelta: CGFloat = 0.4) -> UIColor {
        return makeColor(componentDelta: -1 * componentDelta)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(categoryName: "Deep")
            .environmentObject(ModelData())
    }
}
