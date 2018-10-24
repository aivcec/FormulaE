//
//  DriverDetailsVC.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 18/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverDetailsVC: UIViewController {
    
    // MARK: - Private properties
    
    private var vm: DriverDetailsVMType!
    
    // MARK: - Views
    
    private let loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        
        tableView.register(DriverDetailCell.self, forCellReuseIdentifier: DriverDetailCell.className)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: - Setup
    
    init(vm: DriverDetailsVMType) {
        self.vm = vm
        
        super.init(nibName: nil, bundle: nil)
        title = vm.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
        vm.viewDelegate = self
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        tableView.fillSuperviewSafeArea()
        
        view.addSubview(loadingView)
        NSLayoutConstraint.activate([
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 300),
            loadingView.heightAnchor.constraint(equalToConstant: 150)
            ])
    }
}

// MARK: - TableView Delegate & DataSource

extension DriverDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (vm.circuitData.count != 0 && vm.constructorData.count != 0) ? 2 :  0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Circuits" : "Constructors"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return vm.circuitData.count
        } else {
            return vm.constructorData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailData: DriverDetailData
        if indexPath.section == 0 {
            detailData = vm.circuitData[indexPath.row]
        } else {
            detailData = vm.constructorData[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverDetailCell.className, for: indexPath) as! DriverDetailCell
        
        cell.conifgureWith(data: detailData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DriverDetailCell.defaultHeight
    }
}

// MARK: - DriverDetailsVMViewProtocol

extension DriverDetailsVC: DriverDetailsVMViewProtocol {
    
    func updateLoadProgress(progress: Float) {
        DispatchQueue.main.async {
            self.loadingView.progressView.setProgress(progress, animated: true)
        }
        
        if progress == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.loadingView.isHidden = true
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }
    
    func requireReload() {
        
    }
}
