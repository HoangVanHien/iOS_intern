//
//  TriangleView.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 7/29/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class TriangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        context.closePath()
        context.setFillColor(UIColor.darkGray.cgColor)
        context.fillPath()
    }
}
