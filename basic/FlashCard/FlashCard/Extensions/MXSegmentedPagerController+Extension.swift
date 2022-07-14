//
//  MXSegmentedPagerController+Extension.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 10/5/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import MXSegmentedPager

extension MXSegmentedPagerController {
    @objc func selectAtIndex(sender: Any?) {
        guard let gesture = sender as? UITapGestureRecognizer else {
            return
        }
        guard let index = gesture.view?.tag else {
            return
        }
        segmentedPager.pager.showPage(at: index, animated: false)
    }
    
    func addGestureForSegments() {
        for index in 0..<segmentedPager.segmentedControl.count {
            guard let segment = segmentedPager.segmentedControl.segment(at: index) else {
                return
            }
            let view = UIView(frame: segment.frame)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            view.tag = index
            if let scrollView = segmentedPager.segmentedControl.subviews[0] as? UIScrollView {
                scrollView.addSubview(view)
            }
            let tap = UITapGestureRecognizer(target: self,
                                             action: #selector(selectAtIndex))
            view.addGestureRecognizer(tap)
        }
    }
}
