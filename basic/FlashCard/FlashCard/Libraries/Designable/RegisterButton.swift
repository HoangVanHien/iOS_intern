//
//  RegistAccButton.swift
//  LoginWithFacebook
//
//  Created by Nguyễn Đức Tân on 5/28/20.
//  Copyright © 2020 Nguyễn Đức Tân. All rights reserved.
//

import UIKit

class RegisterButton: UIButton {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setUpView()

    }
    
    func setUpView() {
        layer.cornerRadius = 5
    }
    
}
