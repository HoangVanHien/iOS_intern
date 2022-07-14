//
//  PurchasedMangaEmptyView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/23/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class PurchasedMangaEmptyView: UIView {

    lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .icBook
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var firstLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizable.noPurchasedMangaYet
        label.textColor = .darkGray
        label.font = UIFont.hiraginoSansW6(15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()
    
    lazy var secondLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizable.displayedWhenThereIsAPurchasedManga
        label.textColor = .darkGray
        label.font = UIFont.hiraginoSansW3(15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: DeviceInfo.width, height: DeviceInfo.height)
    }
    
    override func layoutSubviews() {
        backgroundColor = .white
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.342995).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.0915179).isActive = true
        firstLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        firstLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        
        secondLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 15).isActive = true
    }
}
