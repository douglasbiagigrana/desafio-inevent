//
//  BookNetworking.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 11/04/22.
//

import Foundation

enum ResultError: Error {
    case badURL, noData, invalidJSON
}

class BookNetworking {
    struct Constants {
        static let apiTitle = URL(string: "https://api.mercadoeditorial.org/api/v1.2/book?titulo=harry")
    }
    
    func fetchBookByTitle(completion: @escaping (Result<WelcomeBook, ResultError>) -> Void) {
        guard let urlByTitle = Constants.apiTitle else {
            completion(.failure(.badURL))
            return
        }
        let task = URLSession.shared.dataTask(with: urlByTitle) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                completion(.failure(.invalidJSON))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(WelcomeBook.self, from: data)
                completion(.success(result))
            } catch {
                print("fetchBookByTitle with error -> \(error)")
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
}
