//
//  CircleInCenterView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 9/11/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class CircleInCenterView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.addEllipse(in: CGRect(x: frame.width/2 - 13, y: frame.height/2 - 13, width: 26, height: 26))
        context.closePath()
        context.setFillColor(UIColor.black.cgColor)
        context.fillPath()
    }
}
