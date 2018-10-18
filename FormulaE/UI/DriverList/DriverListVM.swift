//
//  DriverListVM.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI

class DriverListVM: DriverListVMType {
    
    private weak var coordinatorDelegate: DriverListVMCoordinatorProtocol?
    
    weak var viewDelegate: DriverListVMViewDelegate? {
        didSet {
            self.initialFetch()
        }
    }
    
    var cellData: [DriverCellData] = []
    
    var isFetching: Bool = false
    let pageSize: Int = 10
    
    init(delegate: DriverListVMCoordinatorProtocol) {
        self.coordinatorDelegate = delegate
    }
    
    func initialFetch() {
        isFetching = true
        FormulaAPI.fetchDrivers(type: .fe, pageSize: pageSize) { [weak self] drivers in
            guard let sSelf = self else { return }
            
            sSelf.cellData = drivers.map { DriverCellData(id:$0.id, name: $0.givenName, birthDate: $0.dateOfBirth, nationality: $0.nationality) }
            sSelf.viewDelegate?.reloadRequired()
            sSelf.isFetching = false
        }
    }
    
    func fetchNewPage() {
        
        if isFetching || (cellData.count % 10 != 0) {
            return
        }
                
        isFetching = true
        FormulaAPI.fetchDrivers(type: .fe, pageSize: pageSize, offset: cellData.count) { [weak self] drivers in
            guard let sSelf = self else { return }
            
            let cellData = drivers.map { DriverCellData(id:$0.id, name: $0.givenName, birthDate: $0.dateOfBirth, nationality: $0.nationality) }
            sSelf.cellData.append(contentsOf: cellData)
            sSelf.viewDelegate?.reloadRequired()
            sSelf.isFetching = false
        }
    }
    
    func driverTappedAt(_ row: Int) {
        let data = cellData[row]
        coordinatorDelegate?.navigateToDriverDetails(name: data.name, id: data.id)
    }
}
