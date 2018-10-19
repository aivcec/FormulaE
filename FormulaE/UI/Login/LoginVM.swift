//
//  LoginVM.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI

class LoginVM: LoginVMType {
    
    private weak var coordinatorDelegate: LoginVMCoordinatorDelegate?
    
    init(delegate: LoginVMCoordinatorDelegate) {
        coordinatorDelegate = delegate
    }
    
    func loginPressed() {
        coordinatorDelegate?.loginSuccess()
    }
}
