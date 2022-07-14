//
//  UITableViewController+Extension.swift
//  iseten_ios
//
//  Created by hurricane on 5/29/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class func dequeueCell(_ tableView: UITableView, indexPath: IndexPath) -> Self? {
        return tableView.dequeueCell(self, forIndexPath: indexPath)
    }
    
    class func dequeueCell(_ tableView: UITableView) -> Self? {
        return tableView.dequeueCell(self)
    }
}

extension UITableView {
    
    func registerCellByNib<T: UITableViewCell>(_ type: T.Type) {
        register(type.nib, forCellReuseIdentifier: type.identifier)
    }
    
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: type.identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(_ type: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
    
    func dequeueCell<T: UITableViewCell>(_ type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
}
