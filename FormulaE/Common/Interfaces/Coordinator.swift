//
//  Coordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

protocol VMCoordinatorDelegate: class {
    func showErrorAlert(with message: String?)
}

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func finish()
}
