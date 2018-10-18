//
//  DriverDetailsVM.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 18/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI

class DriverDetailsVM: DriverDetailsVMType {
    
    var name: String
    private var id: String
    
    init(name: String, id: String) {
        self.name  = name
        self.id = id
        
        FormulaAPI.fetchDriverCircuits(driverId: id, type: .fe)
    }
}
