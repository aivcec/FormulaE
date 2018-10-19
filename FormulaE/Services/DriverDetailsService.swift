//
//  DriverDetailsService.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import RxSwift
import FormulaAPI

class DriverDetailsService {
    
    private let detailsQueue: String = "details.queue"
    private let bag = DisposeBag()
    
    func fetchDriverCircuits(id: String, completion: @escaping ([Circuit]) -> ()) {
        FormulaAPI
            .driverCircuitsObs(driverId: id)
            .observeOn(SerialDispatchQueueScheduler(internalSerialQueueName: detailsQueue))
            .subscribe(onNext: { circuits in
                completion(circuits)
            })
            .disposed(by: bag)
    }
    
    func fetchDriverConstructors(id: String, completion: @escaping ([Constructor]) -> ()) {
        FormulaAPI
            .driverConstructorsObs(driverId: id)
            .observeOn(SerialDispatchQueueScheduler(internalSerialQueueName: detailsQueue))
            .subscribe(onNext: { constructors in
                completion(constructors)
            })
            .disposed(by: bag)
    }
}
