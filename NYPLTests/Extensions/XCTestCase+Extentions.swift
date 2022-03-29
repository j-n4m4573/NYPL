//
//  XCTestCase+Extentions.swift
//  NYPLTests
//
//  Created by Jamar Gibbs on 3/28/22.
//

import XCTest

extension XCTestCase {
    
    func loadStub(name: String, extension: String) -> Data {
        
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
