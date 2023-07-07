//
//  ModelData.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import Foundation

class ModelData: ObservableObject {
    
    @Published var questions: [Question] = load("questions.json")
    @Published var shuffledQuestions = [Question]()
    
    var favoriteQuestions: [Question] {
        questions.filter { $0.isFavorite }
    }
    
    var categoriesDictionary: Dictionary<Category, [Question]> {
        Dictionary(
            grouping: questions,
            by: { $0.category }
        )
    }
    
    func questions(for categoryName: String) -> [Question] {
        return questions.filter({
            $0.category.rawValue == categoryName
        })
    }
    
    func shuffleQuestions() {
        shuffledQuestions = questions.shuffled()
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
