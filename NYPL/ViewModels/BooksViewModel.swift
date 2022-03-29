//
//  BooksViewModel.swift
//  NYPL
//
//  Created by Jamar Gibbs on 3/28/22.
//

import Foundation

protocol FetchCompletionDelegate: AnyObject {
    func didFetchData()
}

class BooksViewModel {
    let networkService: NetworkService
    weak var delegate: FetchCompletionDelegate?
    
    var books: [Book] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchBooks(for term: String) {
        networkService.fetchBooks(for: term) { [weak self] result in
            switch result {
            case .success(let bookResponse):
                self?.books = bookResponse.books
                self?.delegate?.didFetchData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
