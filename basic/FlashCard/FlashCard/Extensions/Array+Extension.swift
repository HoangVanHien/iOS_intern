//
//  Array+Extension.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 6/5/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import Foundation

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
