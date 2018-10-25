//
//  DriversService.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import Alamofire
import XCTest
@testable import FormulaE

class DriversServiceTests: XCTestCase {
    
    func testService() {
        let service = DriversService()
        let exp = expectation(description: "Successfully fetched drivers.")

        service.fetchDrivers(offset: 0) { response in
            switch response.result {
            case .success(_):
                exp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)

    }
}
