//
//  BaseCoordinator.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class BaseCoordinator: NSObject, Coordinator {
    
    let rootNC: UINavigationController
    private(set) var childCoordinators: [Coordinator] =  []
    
    init(rootNC: UINavigationController) {
        self.rootNC = rootNC
    }
    
    func start() {
        preconditionFailure("Method not implemented.")
    }
    
    func finish() {
        preconditionFailure("Method not implemented.")
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}
