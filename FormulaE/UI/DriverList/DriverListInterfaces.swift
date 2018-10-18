//
//  DriverListInterfaces.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

protocol DriverListVMType {
    var viewDelegate: DriverListVMViewDelegate? { get set }
    var cellData: [DriverCellData] { get }
    
    func fetchNewPage()
    func driverTappedAt(_ row: Int)
}

protocol DriverListVMViewDelegate: class {
    func reloadRequired()
    func insertRequired()
}


protocol DriverListVMCoordinatorProtocol: class {
    func navigateToDriverDetails(name: String, id: String)
}
