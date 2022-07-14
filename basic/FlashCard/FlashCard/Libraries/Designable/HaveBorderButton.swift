//
//  HaveBorderButton.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/18/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class HaveBorderButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        layer.borderWidth = 0.7
        layer.borderColor = UIColor.black.cgColor
    }
}
