//
//  SelfSizedTableView.swift
//  iseten_ios
//
//  Created by Tran Nhat Thong on 8/13/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class SelfSizedTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
      return self.contentSize
    }

    override var contentSize: CGSize {
      didSet {
          self.invalidateIntrinsicContentSize()
      }
    }
}
