//
//  DriverDetailsVC.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 18/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverDetailsVC: UIViewController {
    
    private var vm: DriverDetailsVMType!
    
    init(vm: DriverDetailsVMType) {
        self.vm = vm
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .red
    }
}
