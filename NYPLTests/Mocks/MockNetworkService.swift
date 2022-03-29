//
//  MockNetworkService.swift
//  NYPLTests
//
//  Created by Jamar Gibbs on 3/28/22.
//

import Foundation
@testable import NYPL

class MockNetworkService: APIService {
    var data: Data?
    
    func fetchBooks(for term: String, completion: @escaping (Result<BookResponse, NetworkError>) -> Void) {
        
        guard let data = data else { return }
        let decoder = JSONDecoder()
        let bookResponse = try! decoder.decode(BookResponse.self, from: data)
        
        completion(.success(bookResponse))
        return
    }
    
}
