//
//  DriverListVC.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverListVC: UIViewController {
    
    private var vm: DriverListVMType!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(DriverCell.self, forCellReuseIdentifier: DriverCell.className)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    init(vm: DriverListVMType) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        vm.viewDelegate = self
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.fillSuperviewSafeArea()
    }
}

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

extension DriverListVC: DriverListVMViewDelegate {
    
    func reloadRequired() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func insertRequired() {
        
    }
}
