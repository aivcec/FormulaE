//
//  DriversCoordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

class DriversCoordinator: BaseCoordinator {
    
    override func start() {
        showDriversList()
    }
    
    override func finish() {
        
    }
    
    func showDriversList() {
        let vm = DriverListVM(delegate: self)
        let vc = DriverListVC(vm: vm)
        rootNC.isNavigationBarHidden = false
        
        rootNC.pushViewController(vc, animated: true)
    }
}

extension DriversCoordinator: DriverListVMCoordinatorProtocol {
    
    func navigateToDriverDetails(name: String, id: String) {
        let service = DriverDetailsService()
        let vm = DriverDetailsVM(name: name, id: id, service: service)
        let vc = DriverDetailsVC(vm: vm)
        
        rootNC.pushViewController(vc, animated: true)
    }
}
