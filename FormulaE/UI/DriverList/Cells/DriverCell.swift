//
//  DriverCell.swift
//  FormulaE
//
//  Created by Antonio Ivcec on 17/10/18.
//  Copyright © 2018 Antonio Ivcec. All rights reserved.
//

import UIKit

class DriverCell: UITableViewCell {
    
    static let defaultHeight: CGFloat = 110
    
    fileprivate var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.darkText

        return label
    }()
    
    fileprivate var birthDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.darkText

        return label
    }()
    
    fileprivate var nationalityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.darkText
        
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let arrowView: UIView = {
        let image = UIImage(named: "right-arrow")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = .white
        
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.clipsToBounds = true
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        setupLayout()
        
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(containerView)
        containerView.fillSuperview(padding: UIEdgeInsets(top: 3, left: 6, bottom: 3, right: 6))
        
        containerView.addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 3, left: 15, bottom: 3, right: 15))
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(birthDateLabel)
        stackView.addArrangedSubview(nationalityLabel)
        
        containerView.addSubview(arrowView)
        NSLayoutConstraint.activate([
            arrowView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12)
            ])
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
