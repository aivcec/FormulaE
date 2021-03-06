//
//  DriverDetailCell.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 19/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverDetailCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = 60
    
    fileprivate let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .lightGray
        
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(containerView)
        containerView.fillSuperview(padding: UIEdgeInsets(top: 3, left: 6, bottom: 6, right: 3))
        
        containerView.addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
            ])
    }
}

extension DriverDetailCell {
    func conifgureWith(data: DriverDetailData) {
        detailLabel.text = data.detail
    }
}


