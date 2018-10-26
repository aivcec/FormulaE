//
//  LoginMock.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit
@testable import FormulaE

class MockLoginVMCoordinator: LoginVMCoordinatorDelegate {
    
    var didSucceed: Bool?
    
    func showErrorAlert(with message: String?) {
        didSucceed = false
    }
    
    func loginSuccess() {
        didSucceed = true
    }
}

class MockLoginService: LoginServiceProtocol {
    
    var didSucceed: Bool?
    
    private let shouldSucceed: Bool
    
    init(shouldSucceed: Bool) {
        self.shouldSucceed = shouldSucceed
    }
    
    func peformLogin(from vc: UIViewController, onSuccess: @escaping () -> (), onError: @escaping (String) -> ()) {
        if shouldSucceed {
            onSuccess()
            didSucceed = true
        } else {
            onError("Error")
            didSucceed = false
        }
    }
}
