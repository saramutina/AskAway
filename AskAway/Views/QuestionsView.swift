//
//  QuestionsView.swift
//  AskAway
//
//  Created by Katie Saramutina on 27.06.2023.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var modelData: ModelData
    var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(category.theme.mainColor)
            VStack(alignment: .leading) {
                Text(category.title.rawValue)
                    .padding(.bottom, 10)
                QuestionView(question: category.questions[0])
                
//                Button(action: <#T##() -> Void#>, label: <#T##() -> View#>)
            }
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(category: ModelData().categories[0])
            .environmentObject(ModelData())
    }
}
