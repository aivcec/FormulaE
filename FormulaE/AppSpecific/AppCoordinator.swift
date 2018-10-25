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
    let sessionInfo: SessionInfoType
    
    init(window: UIWindow?, sessionInfo: SessionInfoType) {
        self.window = window
        self.sessionInfo = sessionInfo
        
        super.init(rootNC: UINavigationController())
    }
    
    override func start() {
        guard let window = window else { return }
        
        window.makeKeyAndVisible()
        window.rootViewController = rootNC
        
        if sessionInfo.isActiveSession {
            showDrivers()
        } else {
            showLogin()
        }
    }
    
    func showLogin() {
        let coordinator = LoginCoordinator(rootNC: rootNC)
        coordinator.onCoordinatorFinished = { [weak self] in
            self?.showDrivers()
            self?.removeChildCoordinator(coordinator)
        }
        addChildCoordinator(coordinator)
        coordinator.start()
    }
    
    func showDrivers() {
        let coordinator = DriversCoordinator(rootNC: self.rootNC, sessionInfo: sessionInfo)
        coordinator.onCoordinatorFinished = { [weak self] in
            guard let sSelf = self else { return }
            
            sSelf.sessionInfo.stopSession()
            sSelf.showLogin()
            sSelf.removeChildCoordinator(coordinator)
        }
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
