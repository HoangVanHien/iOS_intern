//
//  Helpers.swift
//  iseten_ios
//
//  Created by hurricane on 5/26/20.
//  Copyright © 2020 hurricane. All rights reserved.
//

import UIKit

class Helpers: NSObject {
    
    static func refreshToken(completion: (() -> Void)? = nil) {
        var params = Parameter()
        params.addParam(AppKey.uuid, value: AccountManager.uuid)
        UserApi(.checkUser, params: params).send { (user) in
            AccountManager.saveUser(user)
            guard let callBack = completion else { return }
            callBack()
        }
    }
    
    class func deleteUser(_ message: String? = nil) {
        AccountManager.removeUUID()
        AccountManager.removeInfoLinkAccount()
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        AppConfig.getConfig { (isCalledApi) in
            if isCalledApi {
                let firstVC = FirstViewController()
                let window = UIApplication.shared.keyWindow
                window?.rootViewController = firstVC
                window?.makeKeyAndVisible()
                if let fullMessage = message {
                    UIAlertController.showError(message: fullMessage, tittle: "")
                }
            }
        }
    }
}
