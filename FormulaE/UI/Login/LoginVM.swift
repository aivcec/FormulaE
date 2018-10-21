//
//  LoginVM.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class LoginVM: LoginVMType {
    
    private weak var coordinatorDelegate: LoginVMCoordinatorDelegate?
    private var service: LoginService
    
    init(delegate: LoginVMCoordinatorDelegate, service: LoginService) {
        coordinatorDelegate = delegate
        self.service = service
    }
    
    func loginPressed(from vc: UIViewController) {
        service.peformLogin(from: vc, onSuccess: { self.coordinatorDelegate?.loginSuccess()}, onError: { error in
            print("error")
        })
    }
}
