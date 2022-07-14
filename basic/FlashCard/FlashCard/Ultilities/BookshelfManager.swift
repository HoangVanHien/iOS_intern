//
//  BookshelfManager.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 7/6/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

struct BookshelfManager {
    static var image: String? {
        return DataLocal.getObject(AppKey.token) as? String
    }
}
