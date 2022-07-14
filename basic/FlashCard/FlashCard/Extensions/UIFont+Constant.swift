//
//  UIFont+Constant.swift
//  iseten_ios
//
//  Created by hurricane on 6/3/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

extension UIFont {
    static func hiraginoSansW3(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W3", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func hiraginoSansW6(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W6", size: size) ?? .boldSystemFont(ofSize: size)
    }
    
    static func hiraginoSansW7(_ size: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W7", size: size) ?? .boldSystemFont(ofSize: size)
    }
}
