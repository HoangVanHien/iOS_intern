//
//  UIViewShadow+Extension.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 6/29/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow(with color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    func removeShadow() {
        layer.shadowOpacity = 0
    }
}

