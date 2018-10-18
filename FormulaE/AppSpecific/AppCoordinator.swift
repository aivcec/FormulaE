//
//  AppCoordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        
        super.init(rootNC: UINavigationController())
    }
    
    override func start() {
        guard let window = window else { return }
        
        window.makeKeyAndVisible()
        window.rootViewController = rootNC
        
        showLogin()
    }
    
    func showLogin() {
        let coordinator = LoginCoordinator(rootNC: rootNC)
        addChildCoordinator(coordinator)
        
        coordinator.start()
    }
    
    override func finish() {
        
    }
}
