//
//  LoginCoordinatorTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class LoginCoordinatorTests: XCTestCase {
    
    func testDidShowLogin() {
        let navController = UINavigationController()
        
        let coordinator = LoginCoordinator(rootNC: navController)
        coordinator.start()
        XCTAssertTrue(navController.viewControllers[0] is LoginVC)
        XCTAssertEqual(navController.viewControllers.count, 1)
    }
}
