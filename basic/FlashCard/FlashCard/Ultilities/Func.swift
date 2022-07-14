//
//  Func.swift
//  iseten_ios
//
//  Created by hurricane on 6/9/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//
import Foundation

public func DLog(_ message: @autoclosure () -> String,
                 filename: String = #file,
                 function: String = #function, line: Int = #line) {
    #if DEBUG
    print("[\(URL(string: filename)?.lastPathComponent ?? filename):\(line)]",
        "\(function)",
        message(),
        separator: " - ")
    #else
    #endif
}

public func ALog(_ message: @autoclosure () -> String,
                 filename: String = #file,
                 function: String = #function,
                 line: Int = #line) {
    print("[\(URL(string: filename)?.lastPathComponent ?? filename):\(line)]",
        "\(function)",
        message(),
        separator: " - ")
}
