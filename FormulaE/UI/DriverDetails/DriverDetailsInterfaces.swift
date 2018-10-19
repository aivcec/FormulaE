//
//  DriverDetailsInterfaces.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 18/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

protocol DriverDetailsVMType {
    var viewDelegate: DriverDetailsVMViewProtocol? { get set }
    
    var name: String { get }
    var circuitData: [DriverDetailData] { get }
    var constructorData: [DriverDetailData] { get }
}


protocol DriverDetailsVMViewProtocol: class {
    func updateLoadProgress(progress: Float)
    func requireReload()
}
