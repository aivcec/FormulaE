//
//  DriversCoordinatorTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class DriversCoordinatorTests: XCTestCase {
    
    func testIsShowingDriverList() {
        let navController = UINavigationController()
        let sessionInfo = SessionInfo()
        let coordinator = DriversCoordinator(rootNC: navController, sessionInfo: sessionInfo)
        coordinator.start()
        XCTAssertTrue(navController.viewControllers[0] is DriverListVC)
        XCTAssertEqual(navController.viewControllers.count, 1)
    }
}
