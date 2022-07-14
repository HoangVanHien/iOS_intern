//
//  FailToConnectView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/22/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class FailToConnectView: UIView {

    var tapReconnect: (() -> Void)?
    
    lazy var titleLabel: UILabel = {
       let titleLabel = UILabel(frame: .zero)
        titleLabel.textAlignment = .center
        titleLabel.text = Localizable.failToConnect
        titleLabel.textColor = .lightGray
        titleLabel.font = UIFont.hiraginoSansW3(14)
        titleLabel.numberOfLines = 0
        titleLabel.setLineSpace(withHeigh: 5)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        return titleLabel
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .logo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(Localizable.reconnect, for: .normal)
        button.setTitleColor(.primaryColor, for: .normal)
        button.titleLabel?.font = UIFont.hiraginoSansW6(15)
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(reConnect), for: .touchUpInside)
        addSubview(button)

        return button
    }()
    
    override func layoutSubviews() {
        
        backgroundColor = .white
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.572464).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.268116).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 111/95).isActive = true
        
        button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.190821).isActive = true
        
    }
    
    @objc func reConnect() {
        if let tapCallBack = tapReconnect {
            tapCallBack()
        }
    }
}
