//
//  AccountManager.swift
//  iseten_ios
//
//  Created by hurricane on 6/9/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

struct AccountManager {
    
    static var isExistUUID: Bool {
        return uuid != nil
    }
    
    static var isLinkAccount: Bool {
        return KeyChainManager.getString(forKey: AppKey.accountType) != "0"
    }
    
    static var userCode: String? {
        guard let code = DataLocal.getObject(AppKey.userCode) as? String else { return nil }
        return code
    }
    
    static var token: String? {
        return DataLocal.getObject(AppKey.token) as? String
    }
    
    static var uuid: String? {
        return KeyChainManager.getString(forKey: AppKey.uuid)
    }
    
    static var nickName: String? {
        return KeyChainManager.getString(forKey: AppKey.infoLinkAccount)
    }
    
    static var accountType: AccountType? {
        guard let typeString = KeyChainManager.getString(forKey: AppKey.accountType)?.toInt else { return nil }
        return AccountType(rawValue: typeString)
    }
    
    static func removeUUID() {
        KeyChainManager.removeValue(forKey: AppKey.uuid)
    }
    
    static func saveInfoLinkAccount(_ typeAccount: AccountType? = nil, infoString: String? = nil) {
        if let type = typeAccount {
            KeyChainManager.saveString(value: type.rawValue.toString, forKey: AppKey.accountType)
        }
        if let nickName = infoString {
            KeyChainManager.saveString(value: nickName, forKey: AppKey.infoLinkAccount)
        }
    }
    
    static func removeInfoLinkAccount() {
        KeyChainManager.removeValue(forKey: AppKey.accountType)
        KeyChainManager.removeValue(forKey: AppKey.infoLinkAccount)
    }
    
    static func saveUser(_ user: User?) {
        DataLocal.saveObject(user?.userCode, forKey: AppKey.userCode)
        DataLocal.saveObject(user?.token, forKey: AppKey.token)
        DLog("token:  ", filename: user?.token ?? "")
    }
    
    static func saveProfile(_ account: Account?) {
        DataLocal.saveObject(account?.user?.avatarUrl, forKey: AppKey.avatarURL)
        DataLocal.saveObject(account?.user?.birthday, forKey: AppKey.birthday)
        DataLocal.saveObject(account?.user?.email, forKey: AppKey.email)
        DataLocal.saveObject(account?.user?.facebookId, forKey: AppKey.facebookID)
        DataLocal.saveObject(account?.user?.twitterId, forKey: AppKey.twitterID)
        DataLocal.saveObject(account?.user?.gender, forKey: AppKey.gender)
        DataLocal.saveObject(account?.user?.newEmail, forKey: AppKey.newEmail)
        DataLocal.saveObject(account?.user?.freeCoin, forKey: AppKey.freeCoin)
        DataLocal.saveObject(account?.user?.payCoin, forKey: AppKey.payCoin)
        DataLocal.saveObject(account?.user?.totalMoney, forKey: AppKey.totalMoney)
        DataLocal.saveObject(account?.user?.statusNotification, forKey: AppKey.statusNoti)
    }
}
