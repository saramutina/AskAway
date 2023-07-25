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
        self.questions = getNewDataWithFavorites(for: "questions.json")
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
    
    func save<T:Codable>(_ questions: [T], filename: String) {
        var file: URL
        do {
            file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(filename)
        } catch {
            fatalError("Coudn't read or create \(filename): \(error.localizedDescription)")
        }
        
        do {
            try JSONEncoder().encode(questions).write(to: file)
        } catch {
            fatalError("Couldn't write questions to \(filename): \n\(error)")
        }
    }
}

func getNewDataWithFavorites(for filename: String) -> [Question] {
    var bundleFile = [Question]()
    var storedFile = [Question]()
    var persistedFavoritesFile = [Question]()
    
    bundleFile = Bundle.load(filename)
    storedFile = readData(filename) ?? []
    
    let existingFavorites = storedFile.filter({$0.isFavorite == true})
    
    if bundleFile.count == storedFile.count {
        return storedFile
    } else {
        for question in bundleFile {
            if let favoriteQuestion = existingFavorites.first(where: {$0.id == question.id}) {
                persistedFavoritesFile.append(favoriteQuestion)
            } else {
                persistedFavoritesFile.append(question)
            }
        }
        return persistedFavoritesFile
    }
}

func readData(_ filename: String) -> [Question]? {
    var file: URL
    var data: Data
    
    do {
        file = try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true)
            .appendingPathComponent(filename)
    } catch {
        fatalError("Couldn't read or create \(filename): \n\(error)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        print("Couldn't load \(filename) from main bundle or document directory: \n\(error)")
        return nil
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Question].self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \([Question].self):\n\(error)")
    }
}

extension Bundle {
    static func load<T: Decodable>(_ filename: String) -> T {
        var data: Data
        
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
}
