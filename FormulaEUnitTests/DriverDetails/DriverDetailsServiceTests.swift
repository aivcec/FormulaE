//
//  DriverDetailsServiceTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class DriverDetailsServiceTests: XCTestCase {
    
    func testConstructorsCall() {
        let service = DriverDetailsService()
        let exp = expectation(description: "Successfully fetched constructors.")

        service.fetchDriverConstructors(id: "abc") { _ in
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testCircuitsCall() {
        let service = DriverDetailsService()
        let exp = expectation(description: "Successfully fetched circuits.")
        
        service.fetchDriverCircuits(id: "abc") { _ in
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
