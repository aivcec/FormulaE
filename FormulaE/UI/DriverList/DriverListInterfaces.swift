//
//  DriverListInterfaces.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

enum DriverListNavigationOption: Equatable {
    case login, details(name: String, id: String)
}

protocol DriverListVMType {
    var viewDelegate: DriverListVMViewDelegate? { get set }
    
    var title: String { get }
    var cellData: [DriverCellData] { get }
    
    func fetchNewPage()
    func driverTappedAt(_ row: Int)
    func logoutTapped()
}

protocol DriverListVMViewDelegate: class {
    func reloadRequired()
}


protocol DriverListVMCoordinatorProtocol: VMCoordinatorDelegate {
    func navigateTo(_ option: DriverListNavigationOption)
}

