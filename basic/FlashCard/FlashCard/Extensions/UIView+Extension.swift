//
//  UIView+Extension.swift
//  iseten_ios
//
//  Created by Phùng Tùng on 7/9/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

// MARK: - Add Corner Radius
extension UIView {
    @IBInspectable var cornerRadiusX: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var safeTopInset: CGFloat {
        if #available(iOS 11.0, *) {
            return safeAreaInsets.top
        } else {
            return 0
        }
    }
    
    var safeBottomInset: CGFloat {
        if #available(iOS 11.0, *) {
            return safeAreaInsets.bottom
        } else {
            return 0
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }
    
    func addBorders(edges: [UIRectEdge],
                    color: UIColor = .white,
                    width: CGFloat = 1.0,
                    constant: CGFloat = 0) {
        edges.forEach { addBorder(edge: $0,
                                 color: color,
                                 width: width,
                                 constant: constant) }
    }
    
    func addBorder(edge: UIRectEdge,
                   color: UIColor = .white,
                   width: CGFloat = 1.0,
                   constant: CGFloat = 0) {
        let border = UIView(frame: .zero)
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        addSubview(border)
        bringSubviewToFront(border)
        
        switch edge {
        case .left:
            border.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            border.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
            border.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant).isActive = true
            border.widthAnchor.constraint(equalToConstant: width).isActive = true
        case .right:
            border.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            border.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
            border.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant).isActive = true
            border.widthAnchor.constraint(equalToConstant: width).isActive = true
        case .top:
            border.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant).isActive = true
            border.topAnchor.constraint(equalTo: topAnchor).isActive = true
            border.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constant).isActive = true
            border.heightAnchor.constraint(equalToConstant: width).isActive = true
        case .bottom:
            border.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant).isActive = true
            border.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            border.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constant).isActive = true
            border.heightAnchor.constraint(equalToConstant: width).isActive = true
        default:
            layer.borderColor = color.cgColor
            layer.borderWidth = width
        }
    }
    
    func fitToSuperview() {
        guard let parent = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false        
        leadingAnchor.constraint(equalTo: parent.safeLeadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parent.safeTrailingAnchor).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
    
    func animateSizeUP(size: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: size, height: size)
        }, completion: {(_) in
              self.animateSizeDown(size: size)
        })
    }
    
    func animateSizeDown(size: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bounds = CGRect(x: self.bounds.origin.x,
                                 y: self.bounds.origin.y,
                                 width: size * 0.9,
                                 height: size * 0.9)
        }, completion: {(_) in
            self.animateSizeUP(size: size)
        })
    }
    
    func addBlurEffectView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurredEffectView, at: 0)
    }
}
