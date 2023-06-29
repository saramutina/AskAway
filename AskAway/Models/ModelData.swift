//
//  ModelData.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import Foundation

class ModelData: ObservableObject {
    @Published var categories: [Category] = load("questionsByCategory.json")
    
    func getQuestions(for category: String) -> [Question] {
        guard let foundCategory = categories.first(where: {$0.title.rawValue == category}) else {
            fatalError("Couldn't find category \(category).")
        }
        return foundCategory.questions
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}
