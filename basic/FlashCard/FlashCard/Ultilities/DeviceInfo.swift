//
//  DeviceInfo.swift
//  iseten_ios
//
//  Created by hurricane on 5/29/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

struct DeviceInfo {
    static var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    static var width: CGFloat {
        return screenSize.width
    }
    
    static var height: CGFloat {
        return screenSize.height
    }
    
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    static var isPortrait: Bool {
        UIDevice.current.orientation == .portrait
            || UIDevice.current.orientation == .portraitUpsideDown
    }
}
