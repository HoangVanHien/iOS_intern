//
//  StorageData.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/13/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import Foundation

class TagData: NSObject, NSCoding {
    
    private var name: String?
    private var id: Int64?
    
    var tagName: String? {
        get {
            return name
        }
        set {
            name = newValue
        }
    }
    
    var tagID: Int64? {
        get {
            return id
        }
        set {
            id = newValue
        }
    }
    
    init(tagName: String?, tagID: Int64?) {
        
        name = tagName
        id = tagID
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let id = aDecoder.decodeObject(forKey: "id") as? Int64
        self.init(tagName: name, tagID: id)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(id, forKey: "id")
    }
}

class WeekDayData: NSObject, NSCoding {
    
    private var name: String?
    private var day: Int64?
    
    var weekDayName: String? {
        get {
            return name
        }
        set {
            name = newValue
        }
    }
    
    var weekDayID: Int64? {
        get {
            return day
        }
        set {
            day = newValue
        }
    }
    
    init(weekDayName: String?, weekDayID: Int64?) {
        
        name = weekDayName
        day = weekDayID
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let day = aDecoder.decodeObject(forKey: "day") as? Int64
        self.init(weekDayName: name, weekDayID: day)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(day, forKey: "day")
    }
}

class ComicThumbnailData: NSObject, NSCoding {
    
    var id: Int64?
    var title: String?
    var thumbnail: String?
    var tag: String?
    var writer: String?
    var statusFavorite: Int?
    var favoriteCount: Int64?
    var descriptionn: String?
    
    var comicId: Int64? {
        get {
            return id
        }
        set {
            id = newValue
        }
    }
    var comicTitle: String? {
        get {
            return title
        }
        set {
            title = newValue
        }
    }
    var comicThumbnail: String? {
        get {
            return thumbnail
        }
        set {
            thumbnail = newValue
        }
    }
    var comicTag: String? {
        get {
            return tag
        }
        set {
            tag = newValue
        }
    }
    var comicWriter: String? {
        get {
            return writer
        }
        set {
            writer = newValue
        }
    }
    var comicStatusFavorite: Int? {
        get {
            return statusFavorite
        }
        set {
            statusFavorite = newValue
        }
    }
    var comicFavoriteCount: Int64? {
        get {
            return favoriteCount
        }
        set {
            favoriteCount = newValue
        }
    }
    var comicDescription: String? {
        get {
            return description
        }
        set {
            descriptionn = newValue
        }
    }
    
    init(comicId: Int64?,
         comicTitle: String?,
         comicThumbnail: String?,
         comicTag: String?,
         comicWriter: String?,
         comicStatusFavorite: Int?,
         comicFavoriteCount: Int64?,
         comicDescription: String?) {
        id = comicId
        title = comicTitle
        thumbnail = comicThumbnail
        tag = comicTag
        writer = comicWriter
        statusFavorite = comicStatusFavorite
        favoriteCount = comicFavoriteCount
        descriptionn = comicDescription
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as? Int64
        let title = aDecoder.decodeObject(forKey: "title") as? String
        let thumbnail = aDecoder.decodeObject(forKey: "thumbnail") as? String
        let tag = aDecoder.decodeObject(forKey: "tag") as? String
        let writer = aDecoder.decodeObject(forKey: "writter") as? String
        let statusFavorite = aDecoder.decodeObject(forKey: "statusFavorite") as? Int
        let favoriteCount = aDecoder.decodeObject(forKey: "favoriteCount") as? Int64
        let description = aDecoder.decodeObject(forKey: "description") as? String
        self.init(comicId: id,
                  comicTitle: title,
                  comicThumbnail: thumbnail,
                  comicTag: tag,
                  comicWriter: writer,
                  comicStatusFavorite: statusFavorite,
                  comicFavoriteCount: favoriteCount,
                  comicDescription: description)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(thumbnail, forKey: "thumbnail")
        aCoder.encode(tag, forKey: "tag")
        aCoder.encode(writer, forKey: "writter")
        aCoder.encode(statusFavorite, forKey: "statusFavorite")
        aCoder.encode(favoriteCount, forKey: "favoriteCount")
        aCoder.encode(descriptionn, forKey: "description")
    }
}

struct LocalComicManager {
    
    static func saveData(forKey key: String, _ comics: [ComicThumbnail]) {
        var comicData : [ComicThumbnailData] = []
        for comic in comics {
            comicData.append(ComicThumbnailData(comicId: comic.id,
                                                comicTitle: comic.title,
                                                comicThumbnail: comic.thumbnail,
                                                comicTag: comic.tag,
                                                comicWriter: comic.writer,
                                                comicStatusFavorite: comic.statusFavorite,
                                                comicFavoriteCount: comic.favoriteCount,
                                                comicDescription: comic.description))
        }
        let localComicData = NSKeyedArchiver.archivedData(withRootObject: comicData)
        DataLocal.saveObject(localComicData, forKey: key)
    }
    
    static func getData(forKey key: String) -> [ComicThumbnailData]? {
        guard let comicData = DataLocal.getObject(key) as? Data else {
            return nil
        }
        guard let comicArray = NSKeyedUnarchiver.unarchiveObject(with: comicData) as?
            [ComicThumbnailData] else {
                return nil
        }
        return comicArray
    }
    
    static func updateFavorite(comic: ComicThumbnail? = nil,
                               comicData: ComicThumbnailData? = nil,
                               _ statusFavorite: Int) {
        
        var rawComic: ComicThumbnailData?
        if let comic = comic {
            rawComic = ComicThumbnailData(comicId: comic.id,
                                          comicTitle: comic.title,
                                          comicThumbnail: comic.thumbnail,
                                          comicTag: comic.tag,
                                          comicWriter: comic.writer,
                                          comicStatusFavorite: comic.statusFavorite,
                                          comicFavoriteCount: comic.favoriteCount,
                                          comicDescription: comic.description)
        } else {
            rawComic = comicData
        }
        
        guard let updatingComic = rawComic else {
            return
        }
        
        let viewedComic = getData(forKey: AppKey.viewedComic)
        var favoriteComic = getData(forKey: AppKey.favoriteComic)
        let purchasedComic = getData(forKey: AppKey.purchasedComic)
        for comic in viewedComic ?? [] {
            if comic.id == updatingComic.id {
                comic.statusFavorite = statusFavorite
            }
        }
        let viewedComicData = NSKeyedArchiver.archivedData(withRootObject: viewedComic ?? [])
        DataLocal.saveObject(viewedComicData, forKey: AppKey.viewedComic)
        
        if statusFavorite == 0 {
            var index = 0
            while index < (favoriteComic?.count ?? 0) {
                if favoriteComic?[index].id == updatingComic.id {
                    favoriteComic?.remove(at: index)
                } else {
                    index += 1
                }
            }
        } else {
            favoriteComic?.insert(updatingComic, at: 0)
        }
        let favoriteComicData = NSKeyedArchiver.archivedData(withRootObject: favoriteComic ?? [])
        DataLocal.saveObject(favoriteComicData, forKey: AppKey.favoriteComic)
        
        for comic in purchasedComic ?? [] {
            if comic.id == updatingComic.id {
                comic.statusFavorite = statusFavorite
            }
        }
        let purchasedComicData = NSKeyedArchiver.archivedData(withRootObject: purchasedComic ?? [])
        DataLocal.saveObject(purchasedComicData, forKey: AppKey.purchasedComic)
    }
    
    static func updateViewed(comic : ComicThumbnailData?) {
        var viewedComic = getData(forKey: AppKey.viewedComic)
        guard let newComic = comic else {
            return
        }
        var isExist: Bool = false
        for comic in (viewedComic ?? []) {
            if comic.comicId == newComic.comicId {
                isExist = true
            }
        }
        if !isExist {
            viewedComic?.insert(newComic, at: 0)
            let viewedComicData = NSKeyedArchiver.archivedData(withRootObject: viewedComic ?? [])
            DataLocal.saveObject(viewedComicData, forKey: AppKey.viewedComic)
        }
    }
}

class CurrentPage: NSObject, NSCoding {
    private var id: Int64?
    private var currentPage: Int64?
    
    var comicCurrentPage: Int64? {
        get {
            return currentPage
        }
        set {
            currentPage = newValue
        }
    }
    var comicId: Int64? {
        get {
            return id
        }
        set {
            id = newValue
        }
    }
    init(comicId: Int64?, comicCurrentPage: Int64?) {
        id = comicId
        currentPage = comicCurrentPage
    }
    required convenience init(coder aDecoder: NSCoder) {
        let currentPage = aDecoder.decodeObject(forKey: "currentPage") as? Int64
        let id = aDecoder.decodeObject(forKey: "id") as? Int64
        self.init(comicId: id, comicCurrentPage: currentPage)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(currentPage, forKey: "currentPage")
        aCoder.encode(id, forKey: "id")
    }
}

class BannerData: NSObject, NSCoding {
    private var id: Int64?
    private var type: Int?
    private var title: String?
    private var image: String?
    private var url: String?
    private var comics: [ComicThumbnailData]?
    
    var bannerId: Int64? {
        get {
            return id
        }
        set {
            id = newValue
        }
    }
    
    var bannerType: Int? {
        get {
            return type
        }
        set {
            type = newValue
        }
    }
    
    var bannerTitle: String? {
        get {
            return title
        }
        set {
            title = newValue
        }
    }
    
    var bannerImage: String? {
        get {
            return image
        }
        set {
            image = newValue
        }
    }
    
    var bannerUrl: String? {
        get {
            return url
        }
        set {
            url = newValue
        }
    }
    
    var bannerComic: [ComicThumbnailData]? {
        get {
            return comics
        }
        set {
            comics = newValue
        }
    }
    
    init(bannerId: Int64?,
         bannerType: Int?,
         bannerTitle: String?,
         bannerImage: String?,
         bannerUrl: String?,
         bannerComic: [ComicThumbnailData]?) {
        id = bannerId
        type = bannerType
        title = bannerTitle
        image = bannerImage
        url = bannerUrl
        comics = bannerComic
    }
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as? Int64
        let type = aDecoder.decodeObject(forKey: "type") as? Int
        let title = aDecoder.decodeObject(forKey: "title") as? String
        let image = aDecoder.decodeObject(forKey: "image") as? String
        let url = aDecoder.decodeObject(forKey: "url") as? String
        let comic = aDecoder.decodeObject(forKey: "comics") as? [ComicThumbnailData]
        self.init(bannerId: id,
                  bannerType: type,
                  bannerTitle: title,
                  bannerImage: image,
                  bannerUrl: url,
                  bannerComic: comic)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(comics, forKey: "comics")
    }
}
