//
//  AppConfig.swift
//  iseten_ios
//
//  Created by hurricane on 6/9/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit
import Firebase

struct AppConfig {
    
    static let developUrl = "http://manga-web.kiaisoft.com/api"
    static let stagingUrl = "http://stg-manga.kiaisoft.com/api"
    
    static var baseUrl: String = {
        var string = developUrl
        #if !DEBUG
        string = stagingUrl
        #endif
        if ProcessInfo.processInfo.environment["staging"] == "on" {
            string = stagingUrl
        }
        return string
    }()
    
    static func getConfig(completion: @escaping (Bool) -> Void) {
        AppConfigApi().send { (listConfig,error) in
            if error != nil {
                completion(false)
            } else {
                guard let listConfig = listConfig else {
                    completion(false)
                    return
                }
                guard let listTag = listConfig.tags,
                    let listWeekDay = listConfig.weekDays,
                    let banner = listConfig.banner else {
                    completion(false)
                    return
                }
                var tags: [TagData] = []
                for tag in listTag {
                    tags.append(TagData(tagName: tag.name, tagID: tag.id))
                }
                var weekDays: [WeekDayData] = []
                for day in listWeekDay {
                    weekDays.append(WeekDayData(weekDayName: day.name, weekDayID: day.day))
                }
                
                var comicsData : [ComicThumbnailData] = []
                if let comics = banner.comics {
                    for comic in comics {
                        comicsData.append(ComicThumbnailData(comicId: comic.id,
                                                             comicTitle: comic.title,
                                                             comicThumbnail: comic.thumbnail,
                                                             comicTag: comic.tag,
                                                             comicWriter: comic.writer,
                                                             comicStatusFavorite: comic.statusFavorite,
                                                             comicFavoriteCount: comic.favoriteCount,
                                                             comicDescription: comic.description))
                    }
                }
                
                let bannerData = BannerData(bannerId: banner.id,
                                            bannerType: banner.type,
                                            bannerTitle: banner.title,
                                            bannerImage: banner.image,
                                            bannerUrl: banner.url,
                                            bannerComic: comicsData)
                
                let tagsData = NSKeyedArchiver.archivedData(withRootObject: tags)
                let weekDayData = NSKeyedArchiver.archivedData(withRootObject: weekDays)
                let bannnerData = NSKeyedArchiver.archivedData(withRootObject: bannerData)
                
                DataLocal.saveObject(tagsData, forKey: AppKey.tags)
                DataLocal.saveObject(weekDayData, forKey: AppKey.weekDay)
                DataLocal.saveObject(bannnerData, forKey: AppKey.banner)
                completion(true)
            }
        }
    }
    
    static func postDeviceToken(completion: @escaping (Bool) -> Void) {
        InstanceID.instanceID().instanceID { (result, error) in
            if error != nil {
                completion(false)
            } else if let result = result {
                var param = Parameter()
                param.addParam(AppKey.deviceToken, value: result.token)
                DeviceTokenApi(params: param).send { (account, error) in
                    if error != nil {
                        completion(false)
                    } else {
                        if let account = account {
                            AccountManager.saveProfile(account)
                            completion(true)
                        }
                    }
                }
            }
        }
    }
    
    static func callApiCheckUser(completion: @escaping (Bool) -> Void) {
        var params = Parameter()
        params.addParam(AppKey.uuid, value: AccountManager.uuid)
        UserApi(.checkUser, params: params).send { (user,error) in
            if error != nil {
                completion(false)
            } else {
                if let user = user {
                    AccountManager.saveUser(user)
                    completion(true)
                }
            }
        }
    }
}
