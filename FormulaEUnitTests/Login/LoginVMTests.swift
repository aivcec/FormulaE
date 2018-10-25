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
        let mockService = MockLoginService(resultOnCall: .success)
        let mockVC = UIViewController()
        
        let vm = LoginVM(delegate: mockCoordinator, service: mockService)
        vm.loginPressed(from: mockVC)
        
        XCTAssertEqual(mockService.result, .success)
        XCTAssertEqual(mockCoordinator.result, .success)
    }
    
    func testFailedLoginFlow() {
        
        let mockCoordinator = MockLoginVMCoordinator()
        let mockService = MockLoginService(resultOnCall: .failure)
        let mockVC = UIViewController()
        
        let vm = LoginVM(delegate: mockCoordinator, service: mockService)
        vm.loginPressed(from: mockVC)
        
        XCTAssertEqual(mockService.result, .failure)
        XCTAssertEqual(mockCoordinator.result, .failure)
    }
}
