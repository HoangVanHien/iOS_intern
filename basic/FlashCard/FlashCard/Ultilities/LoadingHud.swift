//
//  LoadingHud.swift
//  iseten_ios
//
//  Created by Phùng Tùng on 7/17/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    lazy var animationView: AnimationView = {
        let animationView = AnimationView(name: "iseten")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animationView)
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(white: 1, alpha: 0.9)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}

var loadingView: LoadingView = {
    let view = LoadingView(frame: UIScreen.main.bounds)
    return view
}()

struct LoadingHud {
    
    static func show() {
        loadingView.animationView.play()
        UIApplication.shared.keyWindow?.addSubview(loadingView)
    }
    
    static func hide() {
        loadingView.removeFromSuperview()
    }
}
