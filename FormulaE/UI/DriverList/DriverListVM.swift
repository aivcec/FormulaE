//
//  DriverListVM.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import FormulaAPI
import Alamofire

class DriverListVM: DriverListVMType {
    
    // MARK: - Delegates
    
    private weak var coordinatorDelegate: DriverListVMCoordinatorProtocol?
    
    weak var viewDelegate: DriverListVMViewDelegate? {
        didSet {
            self.initialFetch()
        }
    }
    
    // MARK: - Properties
    
    private let service: DriversServiceProtocol
    var title: String
    var cellData: [DriverCellData] = []
    
    var isFetching: Bool = false
    let pageSize: Int = 10
    
    // MARK: - Init
    
    init(delegate: DriverListVMCoordinatorProtocol, service: DriversServiceProtocol, name: String) {
        self.service = service
        self.coordinatorDelegate = delegate
        self.title = "Hi, \(name)"
    }
    
    func initialFetch() {
        isFetching = true
        service.fetchDrivers(offset: 0) { response in
            self.handleDriversResult(response.result, isInitial: true)

        }
    }
    
    func fetchNewPage() {
        if isFetching || (cellData.count % 10 != 0) {
            return
        }
        
        isFetching = true
        
        service.fetchDrivers(offset: cellData.count) { response in
            self.handleDriversResult(response.result, isInitial: false)
        }
    }
    
    func driverTappedAt(_ row: Int) {
        let data = cellData[row]
        coordinatorDelegate?.navigateTo(.details(name: data.name, id: data.id))
    }
    
    func logoutTapped() {
        coordinatorDelegate?.navigateTo(.login)
    }
    
    // MARK: - Handlers
    
    private func handleDriversResult(_ result: Result<[Driver]>, isInitial: Bool) {
        switch result {
        case .success(let drivers):
            addDrivers(drivers, isInitial: isInitial)
            viewDelegate?.reloadRequired()
            isFetching = false
        case .failure(let error):
            coordinatorDelegate?.showErrorAlert(with: error.localizedDescription)
        }
    }
    
    private func addDrivers(_ drivers: [Driver], isInitial: Bool) {
        let cellData = drivers.map {
            DriverCellData(id:$0.id, name: "\($0.givenName!) \($0.familyName!)", birthDate: $0.dateOfBirth, nationality: $0.nationality) }
        
        if isInitial {
            self.cellData = cellData
        } else {
            self.cellData.append(contentsOf: cellData)
        }
    }
}
