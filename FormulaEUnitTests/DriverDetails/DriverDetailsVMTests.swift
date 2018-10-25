//
//  DriverDetailsVMTests.swift
//  FormulaEUnitTests
//
//  Created by Antonio Ivcec on 25/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import XCTest
@testable import FormulaE
@testable import FormulaAPI

// MARK: - Mock classes

class MockDriverDetailsView: DriverDetailsVMViewProtocol {
    
    var loadProgress: Float = 0

    func updateLoadProgress(progress: Float) {
        loadProgress += 0.5
    }
}

class MockDriverDetailsService: DriverDetailsServiceProtocol {
    
    private func generateCircuits() -> [Circuit] {
        var circuits = [Circuit]()
        
        for _ in 1...10 {
            let circuit = Circuit(id: "", circuitName: "")
            circuits.append(circuit)
        }
        
        return circuits
    }
    
    private func generateConstructors() -> [Constructor] {
        var constructors = [Constructor]()
        
        for _ in 1...10 {
            let constructor = Constructor(id: "", name: "", nationality: "")
            constructors.append(constructor)
        }
        
        return constructors
    }
    
    func fetchDriverCircuits(id: String, completion: @escaping ([Circuit]) -> ()) {
        let circuits = generateCircuits()
        completion(circuits)
    }
    
    func fetchDriverConstructors(id: String, completion: @escaping ([Constructor]) -> ()) {
        let constructors = generateConstructors()
        completion(constructors)
    }
}


//MARK: - Tests

class DriverDetailsVMTest: XCTestCase {
    
    func testFullDetailFetch() {
        let mockService = MockDriverDetailsService()
        let mockView = MockDriverDetailsView()
        let vm = DriverDetailsVM(name: "", id: "", service: mockService)
        vm.viewDelegate = mockView
        
        XCTAssertEqual(mockView.loadProgress, 1)
    }
}
