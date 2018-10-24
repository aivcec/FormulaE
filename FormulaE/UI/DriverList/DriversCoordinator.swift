//
//  DriversCoordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriversCoordinator: BaseCoordinator {
    
    private let sessionInfo: SessionInfo
    
    init(rootNC: UINavigationController, sessionInfo: SessionInfo) {
        self.sessionInfo = sessionInfo
        super.init(rootNC: rootNC)
    }
    
    override func start() {
        showDriversList()
    }
    
    func showDriversList() {
        let service = DriversService()
        let vm = DriverListVM(delegate: self, service: service, name: sessionInfo.name)
        let vc = DriverListVC(vm: vm)
        rootNC.isNavigationBarHidden = false        
        rootNC.setViewControllers([vc], animated: true)
    }
}

extension DriversCoordinator: DriverListVMCoordinatorProtocol {
    
    func navigateTo(_ option: DriverListNavigationOption) {
        switch option {
        case .login:
            finish()
        case .details(let name, let id):
            openDriverDetails(name: name, id: id)
        }
    }
    
    func openDriverDetails(name: String, id: String) {
        let service = DriverDetailsService()
        let vm = DriverDetailsVM(name: name, id: id, service: service)
        let vc = DriverDetailsVC(vm: vm)
        
        rootNC.pushViewController(vc, animated: true)
    }
}
