//
//  QuestionView.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Categories:")
                ForEach(modelData.questions[1].categories) { category in
                    Text("• \(category.rawValue) ")
                }
            }
            .padding(.bottom)
            .font(.caption)
            Text(modelData.questions[1].text)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(ModelData())
    }
}
