//
//  XButton.swift
//  iseten_ios
//
//  Created by hurricane on 5/26/20.
//  Copyright © 2020 hurricane. All rights reserved.
//

import UIKit

@IBDesignable class XTButton: UIButton {
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var bgColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
}
