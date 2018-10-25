//
//  DriverListVCTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class MockDriverListVM : DriverListVMType {
    
    var didTapLogout: Bool = false
    var didTapDetail: Bool = false
    
    var viewDelegate: DriverListVMViewDelegate?
    
    var title: String = ""
    
    var cellData: [DriverCellData] = []
    
    func fetchNewPage() {

    }
    
    func driverTappedAt(_ row: Int) {
        didTapDetail = true
    }
    
    func logoutTapped() {
        didTapLogout = true
    }
}

class DriverListVCTests: XCTestCase {
    
    func testTapHandlers() {
        let vm = MockDriverListVM()
        let vc = DriverListVC(vm: vm)
        _ = vc.view
        vc.logoutTapped()
        XCTAssertTrue(vm.didTapLogout)
        
        let tableView = UITableView()
        vc.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(vm.didTapDetail)
    }
}
