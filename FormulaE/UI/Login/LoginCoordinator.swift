//
//  LoginCoordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    
    override init(rootNC: UINavigationController) {
        super.init(rootNC: rootNC)
    }
    
    override func start() {
        showLogin()
    }
    
    func showLogin() {
        let vm = LoginVM(delegate: self, service: LoginService())
        let vc = LoginVC(vm: vm)
        rootNC.isNavigationBarHidden = true

        rootNC.setViewControllers([vc], animated: true)
    }
}

extension LoginCoordinator: LoginVMCoordinatorDelegate {
    
    func loginSuccess() {
        finish()
    }
}
