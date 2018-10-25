//
//  LoginMock.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit
@testable import FormulaE

enum MockResult {
    case none, success, failure
}

class MockLoginVMCoordinator: LoginVMCoordinatorDelegate {
    
    var result: MockResult = .none
    
    func showErrorAlert(with message: String?) {
        result = .failure
    }
    
    func loginSuccess() {
        result = .success
    }
}

class MockLoginService: LoginServiceProtocol {
    
    var result: MockResult = .none
    
    private let resultOnCall: MockResult
    
    init(resultOnCall: MockResult) {
        self.resultOnCall = resultOnCall
    }
    
    func peformLogin(from vc: UIViewController, onSuccess: @escaping () -> (), onError: @escaping (String) -> ()) {
        switch self.resultOnCall {
        case .success:
            onSuccess()
            result = .success
        case.failure:
            onError("Error")
            result = .failure
        default:
            fatalError("Test error")
        }
    }
}
