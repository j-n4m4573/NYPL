//
//  NetworkService.swift
//  NYPL
//
//  Created by Jamar Gibbs on 3/28/22.
//

import Foundation

protocol APIService {
    func fetchBooks(for term: String, completion: @escaping (Result<BookResponse, NetworkError>) -> Void)
}

class NetworkService: APIService {
    
    init() {}
    
    func fetchBooks(for term: String, completion: @escaping (Result<BookResponse, NetworkError>) -> Void) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "openlibrary.org"
        components.path = "/search.json"
        components.queryItems = [
            URLQueryItem(name: "q", value: term)
        ]
        
        guard let url = components.url else {
            completion(.failure(.invalidURL))
            return
        }
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(.failure(.requestError))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let bookResponse = try decoder.decode(BookResponse.self, from: data)
                completion(.success(bookResponse))
            } catch {
                    completion(.failure(.decodingError))
                    return
            }
        }.resume()
    }
}


