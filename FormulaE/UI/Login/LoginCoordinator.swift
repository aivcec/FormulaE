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
        rootNC.delegate = self
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
        let coordinator = DriversCoordinator(rootNC: self.rootNC)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

extension LoginCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // ensure the view controller is popping
        guard
            let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromVC) else {
                return
        }
        
        if fromVC is DriverListVC {
            rootNC.isNavigationBarHidden = true
        }
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController, animated: Bool) {
        // ensure the view controller is popping
        guard
            let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromVC) else {
                return
        }
                
        if fromVC is DriverListVC {
            removeChildCoordinator { $0 is DriversCoordinator }
        }
    }
}

extension LoginCoordinator: LoginVMCoordinatorDelegate {
    
    func loginSuccess() {
        showDrivers()
    }
}
