//
//  UIImageView+Extension.swift
//  iseten_ios
//
//  Created by Phùng Tùng on 6/18/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func loadImage(_ imageString: String?, placeholder: UIImage? = nil, completion: (() -> Void)? = nil) {
        guard let url = imageString?.toUrl else { return }
        self.kf.setImage(with: url,
                         placeholder: placeholder,
                         options: nil,
                         progressBlock: nil) { (result) in
                            completion?()
        }
    }
    
    func addBlurEffectImageView() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurredEffectView, at: 0)
    }
    
    func setCoinImage(_ string: String?, textSize: CGFloat = 0) {
        image = nil
        for view in subviews {
            view.removeFromSuperview()
        }
        backgroundColor = .primaryColor
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: textSize)
        label.text = string
        addSubview(label)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
