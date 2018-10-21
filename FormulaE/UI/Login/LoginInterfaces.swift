//
//  LoginInterfaces.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import Foundation
import UIKit

protocol LoginVMType {
    func loginPressed(from vc: UIViewController)
}

protocol LoginVMCoordinatorDelegate: class {
    func loginSuccess()
}
