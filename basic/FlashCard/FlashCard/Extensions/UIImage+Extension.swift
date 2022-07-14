//
//  UIImage+Extension.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/2/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit
extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
