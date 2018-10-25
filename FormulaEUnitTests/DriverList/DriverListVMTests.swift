//
//  DriverListVMTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI
import Alamofire
import XCTest
@testable import FormulaE
@testable import FormulaAPI

// MARK: - Mock classes

class MockError: Error {
    
}

class MockDriverListVMCoordinator: DriverListVMCoordinatorProtocol {
    
    var lastNavigationOption: DriverListNavigationOption?
    var didShowAlert: Bool = false
    
    func navigateTo(_ option: DriverListNavigationOption) {
        lastNavigationOption = option
    }
    
    func showErrorAlert(with message: String?) {
        didShowAlert = true
    }
}

class MockDriversSuccessService: DriversServiceProtocol {
    func generateMockDrivers() -> [Driver] {
        var data: [Driver] = []
        for _ in 1...10 {
            let driver = Driver(id: "", givenName: "", familyName: "", dateOfBirth: "", nationality: "")
            data.append(driver)
        }
        
        return data
    }
    
    var didFetchDrivers: Bool = false
    var lastCalledOffset: Int?
    
    func fetchDrivers(offset: Int, completion: @escaping DriversCompletionBlock) {
        lastCalledOffset = offset
        didFetchDrivers = true
        let data = generateMockDrivers()
        let result = Result<[Driver]>.success(data)
        
        let response = DataResponse<[Driver]>(request: nil, response: nil, data: nil, result: result)
        completion(response)
    }
}

class MockDriversFailedService: DriversServiceProtocol {
    func fetchDrivers(offset: Int, completion: @escaping DriversCompletionBlock) {
        
        let result = Result<[Driver]>.failure(MockError())
        
        let response = DataResponse<[Driver]>(request: nil, response: nil, data: nil, result: result)
        completion(response)
    }
}

class MockDriversView: DriverListVMViewDelegate {
    
    var reloadRequiredCallCount: Int =  0
    
    func reloadRequired() {
        reloadRequiredCallCount += 1
    }
}

// MARK: - Tests

class DriverListVMTests: XCTestCase {
    
    func testSuccessfulFetchOnLoad() {
        let mockCoordinator = MockDriverListVMCoordinator()
        let mockService = MockDriversSuccessService()
        let mockView = MockDriversView()
        
        let vm = DriverListVM(delegate: mockCoordinator, service: mockService, name: "Test")
        
        vm.viewDelegate = mockView
        
        XCTAssertTrue(mockService.didFetchDrivers)
    }
    
    func testFailedFetchOnLoad() {
        let mockCoordinator = MockDriverListVMCoordinator()
        let mockService = MockDriversFailedService()
        let mockView = MockDriversView()
        
        let vm = DriverListVM(delegate: mockCoordinator, service: mockService, name: "Test")
        vm.viewDelegate = mockView
        
        XCTAssertTrue(mockCoordinator.didShowAlert)
    }
    
    func testIsProperlyFetchingNewPage() {
        let mockCoordinator = MockDriverListVMCoordinator()
        let mockService = MockDriversSuccessService()
        let mockView = MockDriversView()
        
        let vm = DriverListVM(delegate: mockCoordinator, service: mockService, name: "Test")
        vm.viewDelegate = mockView
        
        XCTAssertEqual(mockService.lastCalledOffset, 0)
        XCTAssertEqual(vm.cellData.count, 10)
        
        vm.fetchNewPage()
        XCTAssertEqual(mockService.lastCalledOffset, 10)
        XCTAssertEqual(vm.cellData.count, 20)
        
        XCTAssertEqual(mockView.reloadRequiredCallCount, 2)
    }
    
    func testIsPropagatingLogoutEvent() {
        let mockCoordinator = MockDriverListVMCoordinator()
        let mockService = MockDriversSuccessService()
        let mockView = MockDriversView()
        
        let vm = DriverListVM(delegate: mockCoordinator, service: mockService, name: "Test")
        vm.viewDelegate = mockView
        
        vm.logoutTapped()
        
        if mockCoordinator.lastNavigationOption == DriverListNavigationOption.login {
            XCTAssertTrue(true, "Successfully propagated logout tap event")
        } else {
            XCTFail("Failed to propagate logout tap event")
        }
        
    }
    
    func testIsPropagatingDetailEvent() {
        let mockCoordinator = MockDriverListVMCoordinator()
        let mockService = MockDriversSuccessService()
        let mockView = MockDriversView()
        
        let vm = DriverListVM(delegate: mockCoordinator, service: mockService, name: "Test")
        vm.viewDelegate = mockView
        
        vm.driverTappedAt(0)
        
        if mockCoordinator.lastNavigationOption == DriverListNavigationOption.details(name: "", id: "") {
            XCTAssertTrue(true, "Successfully propagated detail tap event")
        } else {
            XCTFail("Failed to propagate detail event")
        }
    }
}
