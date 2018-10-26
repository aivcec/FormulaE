//
//  DriverListVC.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverListVC: UIViewController {
    
    // MARK: - Private properties
    
    private var vm: DriverListVMType!
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(DriverCell.self, forCellReuseIdentifier: DriverCell.className)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        
        return tableView
    }()
    
    // MARK: - Setup
    
    init(vm: DriverListVMType) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
        
        title = vm.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray

        setupLayout()
        setupNavBar()
        vm.viewDelegate = self
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        tableView.fillSuperviewSafeArea()
    }
    
    private func setupNavBar() {
        let button = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutTapped))
        navigationItem.leftBarButtonItem = button
    }
    
    // MARK: - Handlers
    
    @objc func logoutTapped() {
        vm.logoutTapped()
    }
}

// MARK: - TableView Delegate & DataSource

extension DriverListVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Drivers"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DriverCell.className, for: indexPath) as! DriverCell
        cell.configureWith(vm.cellData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DriverCell.defaultHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.driverTappedAt(indexPath.row)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if ((targetContentOffset.pointee.y + scrollView.frame.size.height) >= (scrollView.contentSize.height - 4*DriverCell.defaultHeight)) {
            vm.fetchNewPage()
        }
    }
}

// MARK: - DriverListVMViewDelegate

extension DriverListVC: DriverListVMViewDelegate {
    
    func reloadRequired() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
