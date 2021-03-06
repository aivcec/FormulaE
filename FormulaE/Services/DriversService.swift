//
//  DriversService.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 24/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI

protocol DriversServiceProtocol {
    func fetchDrivers(offset: Int, completion: @escaping DriversCompletionBlock)
}

class DriversService: DriversServiceProtocol {
    
    func fetchDrivers(offset: Int, completion: @escaping DriversCompletionBlock) {
        FormulaAPI.fetchDrivers(type: .fe, offset: offset, completion: completion)
    }
}

