//
//  DriverDetailsVM.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 18/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI
import RxSwift

class DriverDetailsVM: DriverDetailsVMType {
    
    // MARK: - Properties
    
    weak var viewDelegate: DriverDetailsVMViewProtocol? {
        didSet {
            fetchDetails()
        }
    }
    
    var name: String
    var circuitData: [DriverDetailData] = [] {
        didSet {
            loadProgress += 0.5
        }
    }
    var constructorData: [DriverDetailData] = [] {
        didSet {
            loadProgress += 0.5
        }
    }
    
    private var loadProgress: Float = 0 {
        didSet {
            viewDelegate?.updateLoadProgress(progress: loadProgress)
        }
    }
    
    private var id: String
    private let service: DriverDetailsServiceProtocol
    
    // MARK: - Init
    
    init(name: String, id: String, service: DriverDetailsServiceProtocol) {
        self.name  = name
        self.id = id
        self.service = service
    }
    
    private func fetchDetails() {
        service.fetchDriverCircuits(id: id) { circuits in
            self.circuitData = circuits.map { DriverDetailData(detail: $0.circuitName) }
        }
        
        service.fetchDriverConstructors(id: id) { constructors in
            self.constructorData = constructors.map { DriverDetailData(detail: "\($0.name) (\($0.nationality))") }
        }
    }
}
