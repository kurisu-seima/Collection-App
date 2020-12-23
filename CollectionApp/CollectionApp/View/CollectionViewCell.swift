//
//  CollectionViewCell.swift
//  CollectionApp
//
//  Created by くりすせいま on 2020/12/13.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionSubtitleLabel: UILabel!
    @IBOutlet weak var collectionTitleLabel: UILabel!
    
    let colorList: [UIColor] = [.purple, .yellow, .red, .systemPink, .systemIndigo, .blue, .darkGray, .yellow, .green, .brown]
    
    var index: Int = 0

    func setUp() {
        collectionTitleLabel.text = "買うもの"
        collectionSubtitleLabel.text = "テキストテキストテキストテキストテキストテキスト"
        collectionSubtitleLabel.numberOfLines = 0
        self.layer.cornerRadius = 6
        self.contentView.backgroundColor = getBackgroundColor()
    }
    
    func getBackgroundColor() -> UIColor {
        let rondomNum = Int.random(in: 0...(colorList.count - 1))
        print(rondomNum)
        return colorList[rondomNum]
    }
}
