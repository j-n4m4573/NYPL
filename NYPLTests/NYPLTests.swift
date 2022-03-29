//
//  NYPLTests.swift
//  NYPLTests
//
//  Created by Jamar Gibbs on 3/27/22.
//

import XCTest
@testable import NYPL

class NYPLTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    func test_FetchBooksSuccessResponse() {
        let data = loadStub(name: "books", extension: "json")
        let sut = MockNetworkService()
        sut.data = data
        
        sut.fetchBooks(for: "Farenheit 451") { result in
            switch result {
            case .success(let bookResponse):
                XCTAssertTrue(!bookResponse.books.isEmpty)
                return
            case .failure(let error):
                return
            }
        }
    }
}
