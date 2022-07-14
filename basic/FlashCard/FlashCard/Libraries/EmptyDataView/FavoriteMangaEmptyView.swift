//
//  FavoriteMangaEmptyView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/23/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class FavoriteMangaEmptyView: UIView {
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = .icClearStar
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }()
    
    lazy var firstLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizable.youHaveNoFavoriteManga
        label.textColor = .darkGray
        label.font = UIFont.hiraginoSansW6(15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        return label
    }()
    
    lazy var secondLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localizable.letSAddFavoriteManga
        label.textColor = .darkGray
        label.font = UIFont.hiraginoSansW6(15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: DeviceInfo.width, height: DeviceInfo.height)
    }
    
    override func layoutSubviews() {
        backgroundColor = .viewedMangaEmptyCell
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 3/5).isActive = true
        
        secondLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -22).isActive = true
        firstLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor,constant: -14).isActive = true
    }
}
