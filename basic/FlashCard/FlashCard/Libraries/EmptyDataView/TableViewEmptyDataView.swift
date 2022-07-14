//
//  TableViewEmptyDataView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/31/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class TableViewEmptyDataView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .white
        let imageView = UIImageView(frame: .zero)
        imageView.image = .logo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = Localizable.noProductAvailable
        titleLabel.textColor = .lightGray
        titleLabel.font = UIFont.hiraginoSansW3(14)
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.268116).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 111/95).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.572464).isActive = true
        
    }
}
