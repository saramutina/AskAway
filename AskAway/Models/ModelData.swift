//
//  ModelData.swift
//  AskAway
//
//  Created by Katie Saramutina on 20.06.2023.
//

import Foundation

class ModelData: ObservableObject {
    
    @Published var questions: [Question]
    @Published var shuffledQuestions = [Question]()
    
    init() {
        self.questions = Bundle.load("questions.json")
    }
    
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
    
    func saveData(to filename: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Couldn't locate document directory.")
        }
        let jsonURL = documentDirectory
            .appendingPathComponent(filename)
        do {
            try JSONEncoder().encode(questions).write(to: jsonURL, options: .atomic)
        } catch {
            fatalError("Couldn't write questions to \(filename): \n\(error)")
        }
    }
}

extension Bundle {
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Couldn't locate document directory.")
        }
        let jsonURL = documentDirectory
            .appendingPathComponent(filename)
        
        if !FileManager.default.fileExists(atPath: jsonURL.path) {
                    try? FileManager.default.copyItem(at: file, to: jsonURL)
                }
        
        do {
            data = try Data(contentsOf: jsonURL)
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
}
