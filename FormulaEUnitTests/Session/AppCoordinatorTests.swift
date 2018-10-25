//
//  AppCoordinatorTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE

class MockSessionInfo: SessionInfoType {
    var isActiveSession: Bool = false
    
    init(isActive: Bool) {
        isActiveSession = isActive
    }
    
    var token: String?
    
    var name: String = ""
    
    func stopSession() {
        
    }
}

class AppCoordinatorTests: XCTestCase {
    
    func testOpensLoginOnInactiveSession() {
        let mockSessionInfo = MockSessionInfo(isActive: false)
        let coordinator = AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds), sessionInfo: mockSessionInfo)
        coordinator.start()
        
        XCTAssertTrue(coordinator.childCoordinators[0] is LoginCoordinator)
        XCTAssertTrue(coordinator.rootNC.viewControllers[0] is LoginVC)
    }
    
    func testOpensDriversOnActiveSession() {
        let mockSessionInfo = MockSessionInfo(isActive: true)
        let coordinator = AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds), sessionInfo: mockSessionInfo)
        coordinator.start()

        XCTAssertTrue(coordinator.childCoordinators[0] is DriversCoordinator)
        XCTAssertTrue(coordinator.rootNC.viewControllers[0] is DriverListVC)
    }
}
