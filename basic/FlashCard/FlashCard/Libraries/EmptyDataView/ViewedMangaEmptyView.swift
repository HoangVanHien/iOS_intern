//
//  ViewedMangaEmptyView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/22/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class ViewedMangaEmptyView: UIView {
    
    lazy var label : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizable.viewComicToUpdate
        label.textColor = UIColor.darkGray
        label.font = UIFont.hiraginoSansW6(15)
        label.numberOfLines = 0
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .icBook
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        return imageView
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: DeviceInfo.width, height: DeviceInfo.height)
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor.viewedMangaEmptyCell
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.342995).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.0915179).isActive = true
        imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20).isActive = true
    }
}
