//
//  AppConfigData.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 8/12/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import Foundation

struct ApiQueue {
    static let queue = DispatchQueue(label: "getListComic", qos: .background, attributes: .concurrent)
}
