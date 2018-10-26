//
//  LoginTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class LoginTests: XCTestCase {
    
    func testSuccessfulLoginFlow() {
        
        let mockCoordinator = MockLoginVMCoordinator()
        let mockService = MockLoginService(shouldSucceed: true)
        let mockVC = UIViewController()
        
        let vm = LoginVM(delegate: mockCoordinator, service: mockService)
        vm.loginPressed(from: mockVC)
        
        XCTAssertEqual(mockService.didSucceed, true)
        XCTAssertEqual(mockCoordinator.didSucceed, true)
    }
    
    func testFailedLoginFlow() {
        
        let mockCoordinator = MockLoginVMCoordinator()
        let mockService = MockLoginService(shouldSucceed: false)
        let mockVC = UIViewController()
        
        let vm = LoginVM(delegate: mockCoordinator, service: mockService)
        vm.loginPressed(from: mockVC)
        
        XCTAssertEqual(mockService.didSucceed, false)
        XCTAssertEqual(mockCoordinator.didSucceed, false)
    }
}
