//
//  DriverDetailsService.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import RxSwift
import FormulaAPI

protocol DriverDetailsServiceProtocol {
    func fetchDriverCircuits(id: String, completion: @escaping ([Circuit]) -> ())
    func fetchDriverConstructors(id: String, completion: @escaping ([Constructor]) -> ())
}

class DriverDetailsService: DriverDetailsServiceProtocol {
    
    private let detailsQueue: String = "details.queue"
    private let bag = DisposeBag()
    
    func fetchDriverCircuits(id: String, completion: @escaping ([Circuit]) -> ()) {
        FormulaAPI
            .driverCircuitsObs(driverId: id, type: .fe)
            .observeOn(SerialDispatchQueueScheduler(internalSerialQueueName: detailsQueue))
            .subscribe(onNext: { circuits in
                completion(circuits)
            })
            .disposed(by: bag)
        
    }
    
    func fetchDriverConstructors(id: String, completion: @escaping ([Constructor]) -> ()) {
        FormulaAPI
            .driverConstructorsObs(driverId: id, type: .fe)
            .observeOn(SerialDispatchQueueScheduler(internalSerialQueueName: detailsQueue))
            .subscribe(onNext: { constructors in
                completion(constructors)
            })
            .disposed(by: bag)
    }
}
