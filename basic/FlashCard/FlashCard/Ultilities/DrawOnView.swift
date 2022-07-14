//
//  DrawOnView.swift
//  iseten_ios
//
//  Created by Phùng Tùng on 7/13/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class DrawOnView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.gray.cgColor)
        let constant: CGFloat = 35
        context?.move(to: CGPoint(x: constant, y: rect.height - constant))
        context?.addLine(to: CGPoint(x: rect.width - constant, y: constant))
        context?.strokePath()
    }
}
