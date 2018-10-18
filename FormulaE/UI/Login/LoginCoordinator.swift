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
        
        rootNC.isNavigationBarHidden = true
    }
    
    override func start() {
        showLogin()
    }
    
    override func finish() {
        
    }
    
    func showLogin() {
        let vm = LoginVM(delegate: self)
        let vc = LoginVC(vm: vm)
        
        rootNC.pushViewController(vc, animated: true)
    }
    
    func showDrivers() {
        
        let vm = DriverListVM(delegate: self)
        let vc = DriverListVC(vm: vm)
        rootNC.isNavigationBarHidden = false

        rootNC.pushViewController(vc, animated: true)
    }
}

extension LoginCoordinator: LoginVMCoordinatorDelegate {
    
    func loginSuccess() {
        showDrivers()
    }
}

extension LoginCoordinator: DriverListVMCoordinatorProtocol {
    
    func navigateToDriverDetails(name: String, id: String) {
        let vm = DriverDetailsVM(name: name, id: id)
        let vc = DriverDetailsVC(vm: vm)
        
        rootNC.pushViewController(vc, animated: true)
    }
}
