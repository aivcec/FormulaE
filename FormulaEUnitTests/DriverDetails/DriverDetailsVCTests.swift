//
//  DriverDetailsVCTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class MockDriverDetailVM: DriverDetailsVMType {
    
    var viewDelegate: DriverDetailsVMViewProtocol?
    
    var name: String = ""
    
    var circuitData: [DriverDetailData] = []
    
    var constructorData: [DriverDetailData] = []
    
    func setViewDelegateProgress(progress: Float) {
        viewDelegate?.updateLoadProgress(progress: progress)
    }
}

class DriverDetailsVCTests: XCTestCase {
    
    func testIsSettingViewDelegateOnLoad() {
        let vm = MockDriverDetailVM()
        
        let vc = DriverDetailsVC(vm: vm)
        _ = vc.view
        
        XCTAssertTrue(vm.viewDelegate != nil)
    }
}
