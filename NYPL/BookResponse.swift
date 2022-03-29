//
//  BookResponse.swift
//  NYPL
//
//  Created by Jamar Gibbs on 3/28/22.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let books: [Book]
 
    enum CodingKeys: String, CodingKey {
        case books = "docs"
    }
}

// MARK: - Doc
struct Book: Codable {
    let title: String?
    let firstPublishYear: Int?
    let authorName: [String]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case firstPublishYear
        case authorName
    }
}
