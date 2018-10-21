//
//  LoginVC.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    private var vm: LoginVMType!
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.attributedText = NSAttributedString(string: "Formula E",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 43), .foregroundColor : UIColor.black])
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let attrTitle = NSAttributedString(string: "FACEBOOK LOGIN",
                                           attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor : UIColor.white])
        button.setAttributedTitle(attrTitle, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = Constants.Colors.mainTint
        
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    init(vm: LoginVMType) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    @objc func loginTapped() {
        vm.loginPressed()
    }
}
