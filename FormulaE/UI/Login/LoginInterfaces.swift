//
//  LoginInterfaces.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import Foundation

protocol LoginVMType {
    func loginPressed()
}

protocol LoginVMCoordinatorDelegate: class {
    func loginSuccess()
}
