//
//  NYPLTests.swift
//  NYPLTests
//
//  Created by Jamar Gibbs on 3/27/22.
//

import XCTest
@testable import NYPL

class NYPLTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_FetchBooksSuccessResponse() {
        // 1
        let sut = NetworkService()
        sut.fetchBooks(for: "Farenheit 451") { result in
            
        }
    }
}
