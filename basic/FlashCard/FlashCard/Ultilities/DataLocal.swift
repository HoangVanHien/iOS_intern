//
//  Userdefault.swift
//  iseten_ios
//
//  Created by hurricane on 6/10/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class DataLocal: NSObject {
    class func saveObject(_ value: Any?, forKey defaultName: String) {
        UserDefaults.standard.set(value, forKey: defaultName)
    }
        
    class func getObject(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    class func removeObject(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
