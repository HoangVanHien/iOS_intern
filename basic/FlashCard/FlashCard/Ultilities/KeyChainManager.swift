//
//  KeyChainManager.swift
//  iseten_ios
//
//  Created by hurricane on 6/2/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit
import UICKeyChainStore

public struct KeyChainManager {

    static func saveString(value: String?, forKey: String) {
        UICKeyChainStore.setString(value, forKey: forKey)
    }

    static func getString(forKey: String) -> String? {
        return UICKeyChainStore.string(forKey: forKey)
    }

    static func removeValue(forKey: String) {
        UICKeyChainStore.removeItem(forKey: forKey)
    }

    @discardableResult
    static func removeAll() -> Bool {
        return UICKeyChainStore.removeAllItems()
    }
}

