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
    var onCoordinatorFinished: (() -> ())?
    
    init(rootNC: UINavigationController) {
        self.rootNC = rootNC
    }
    
    func start() {
        preconditionFailure("Method not implemented.")
    }
    
    func finish() {
        onCoordinatorFinished?()
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
    
    func removeChildCoordinator(where predicate: (Coordinator) -> Bool) {
        childCoordinators.removeAll { predicate($0) }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}

extension BaseCoordinator: VMCoordinatorDelegate {
    
    func showErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: "Something went wrong", message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        rootNC.present(alert, animated: true, completion: nil)
    }
}
