//
//  TagFlowLayout.swift
//  iseten_ios
//
//  Created by Nguyễn Đức Tân on 9/7/20.
//  Copyright © 2020 KiaiSoft. All rights reserved.
//

import UIKit

class CollectionViewRow {
    var attributes = [UICollectionViewLayoutAttributes]()
    var spacing: CGFloat = 0

    init(spacing: CGFloat) {
        self.spacing = spacing
    }

    func add(attribute: UICollectionViewLayoutAttributes) {
        attributes.append(attribute)
    }

    var rowWidth: CGFloat {
        return attributes.reduce(0, { result, attribute -> CGFloat in
            return result + attribute.frame.width
        }) + CGFloat(attributes.count - 1) * spacing
    }

    func layout(collectionViewWidth: CGFloat) {
         
        var offset : CGFloat = 0
        
        for attribute in attributes {
            attribute.frame.origin.x = offset
            offset += attribute.frame.width + spacing
        }
    }
}

class TagFlowLayout: UICollectionViewFlowLayout {
        
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }

        var rows = [CollectionViewRow]()
        var currentRowY: CGFloat = -1

        for attribute in attributes {
            if currentRowY != attribute.frame.origin.y {
                currentRowY = attribute.frame.origin.y
                rows.append(CollectionViewRow(spacing: 10))
            }
            rows.last?.add(attribute: attribute)
        }
        
        rows.forEach { $0.layout(collectionViewWidth: collectionView?.frame.width ?? 0) }
        return rows.flatMap { $0.attributes }
    }
}
