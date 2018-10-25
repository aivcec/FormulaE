//
//  LoginVCTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class MockLoginVM: LoginVMType {
    
    var didPressLogin: Bool = false
    
    func loginPressed(from vc: UIViewController) {
        didPressLogin = true
    }
}

class LoginVCTests: XCTestCase {
    
    func testLoginTappedCall() {
        let mockVM = MockLoginVM()
        let vc = LoginVC(vm: mockVM)
        _ = vc.view
        vc.loginTapped()
        XCTAssertTrue(mockVM.didPressLogin)
    }
}
