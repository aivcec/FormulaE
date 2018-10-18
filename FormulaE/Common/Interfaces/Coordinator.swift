//
//  Coordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func finish()
}
