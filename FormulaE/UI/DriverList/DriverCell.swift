//
//  DriverCell.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = 80
    
    fileprivate var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    fileprivate var birthDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)

        return label
    }()
    
    fileprivate var nationalityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)

        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(stackView)
        
        stackView.fillSuperview(padding: UIEdgeInsets(top: 3, left: 15, bottom: 3, right: 15))
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(birthDateLabel)
        stackView.addArrangedSubview(nationalityLabel)
    }
    
    override func prepareForReuse() {
        
    }
}

extension DriverCell {
    func configureWith(_ cellData: DriverCellData) {
        nameLabel.text =  cellData.name
        birthDateLabel.text = cellData.birthDate
        nationalityLabel.text  = cellData.nationality
    }
}
