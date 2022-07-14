//
//  Constants.swift
//  iseten_ios
//
//  Created by hurricane on 5/26/20.
//  Copyright © 2020 hurricane. All rights reserved.
//

import UIKit
import TwitterKit

struct AppKey {
    static let uuid = "uuid"
    static let appleLanguages = "AppleLanguages"
    static let userCode = "userCode"
    static let token = "token"
    static let userId = "userId"
    static let isLinkAccount = "isLinkAccount"
    static let email = "email"
    static let type = "type"
    static let passWord = "password"
    static let newPassword = "new_password"
    static let confirmPassword = "confirm_password"
    static let accessToken = "access_token"
    static let accessTokenSecret = "access_token_secret"
    static let accountType = "accountType"
    static let infoLinkAccount = "infoLinkAccount"
    static let newEmail = "new_email"
    static let facebookID = "facebook_id"
    static let twitterID = "twitter_id"
    static let avatarURL = "avatar_url"
    static let gender = "gender"
    static let birthday = "birthday"
    static let freeCoin = "free_coin"
    static let payCoin = "pay_coin"
    static let totalMoney = "total_money"
    static let statusNoti = "status_notification"
    static let nickName = "nick_name"
    static let favoriteTags = "favorite_tags"
    static let comicIDs = "ids"
    static let comicID = "comic_id"
    static let coin = "coin"
    static let readDirection = "read_direction"
    static let deviceType = "device_type"
    static let ios = "ios"
    static let tags = "tags"
    static let weekDay = "week_day"
    static let viewedComic = "viewed_comic"
    static let favoriteComic = "favorite_comic"
    static let purchasedComic = "purchased_comic"
    static let tagId = "tag_id"
    static let history = "history"
    static let banner = "banner"
    static let deviceToken = "device_token"
    static let rotation = "rotation"
    static let topScrolled = "topScrolled"
    static let maxScrolled = "maxScrolled"
    static let searchCancelButtonText = "cancelButtonText"
    static let rankState = "rankState"
}

private struct TwitterAPI {
    static let key = "PqB4VAASS8l2WaunzfvYGZhEC"
    static let secretKey = "iGWXrNNB5IYyMlWy9tThrRhe0wTvfOrXzBz1nrXKCU4sk22MPm"
}

private struct FacebookAPI {
    static let key = "341743773458266"
    static let secretKey = "5ebd290c0d427f3edbbcd2acf07f5666"
}

class Twitter {
    static func configure() {
        TWTRTwitter.sharedInstance().start(withConsumerKey: TwitterAPI.key, consumerSecret: TwitterAPI.secretKey)
    }
}

struct Constants {
    static let tokenUnauthenticated = "Unauthenticated."
}
