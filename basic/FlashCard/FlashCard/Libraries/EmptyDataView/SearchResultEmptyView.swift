//
//  SearchResultEmptyView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/24/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class SearchResultEmptyView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizable.noProductAvailable
        label.textColor = UIColor.lightGray
        label.font = UIFont.hiraginoSansW6(15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

        return label
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .logo
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        return imageView
    }()
    
    override func layoutSubviews() {
        backgroundColor = UIColor.grayBackground
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.268116).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 111/95).isActive = true
        imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20).isActive = true
    }
}
