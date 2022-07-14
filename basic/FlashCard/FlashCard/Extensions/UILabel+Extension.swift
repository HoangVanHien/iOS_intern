//
//  UILabelExtension.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 5/31/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

extension UILabel {
    
    func halfTextColorChange (fullText : String ,
                              firstText : String,
                              secondText: String,
                              color: UIColor = UIColor.blueText ?? UIColor.systemTeal) {
        
        let strNumber: NSString = fullText as NSString
        let range1 = (strNumber).range(of: firstText)
        let range2 = (strNumber).range(of: secondText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: color,
                               range: range1)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor,
                               value: color ,
                               range: range2)
        self.attributedText = attribute
    }
    
    func setLineSpace(withHeigh heigh: CGFloat ) {
        let attributedString = NSMutableAttributedString(string: self.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = heigh
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value:paragraphStyle,
                                      range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
    
    func changePartToBold(withString string: String, boldString: String, font: UIFont) {
        let attributedString = NSMutableAttributedString(string: string,
                                                     attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font:
            UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        self.attributedText = attributedString
    }
    
}
