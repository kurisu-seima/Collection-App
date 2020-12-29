//
//  CollectionViewCell.swift
//  CollectionApp
//
//  Created by くりすせいま on 2020/12/13.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate {
    func cellLongTapped(index: Int, id: String)
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionSubtitleLabel: UILabel!
    @IBOutlet weak var collectionTitleLabel: UILabel!
  
    let colorList: [UIColor] = [.purple, .yellow, .red, .systemPink, .systemIndigo, .blue, .darkGray, .yellow, .green, .brown]
    
    var delegate: CollectionViewCellDelegate?
    
    var index: Int = 0

    func setUp(index: Int) {
        collectionTitleLabel.text = MemoManager.shared.memos[index].title
        collectionSubtitleLabel.text = MemoManager.shared.memos[index].content
        collectionSubtitleLabel.numberOfLines = 0
        self.layer.cornerRadius = 6
        self.contentView.backgroundColor = getBackgroundColor()
        self.index = index
        addLongTapGesture()
    }
    
    func getBackgroundColor() -> UIColor {
        let rondomNum = Int.random(in: 0...(colorList.count - 1))
        print(rondomNum)
        return colorList[rondomNum]
    }
    
    func addLongTapGesture() {
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        self.addGestureRecognizer(longTapGesture)
    }
    
    @objc func longTap(_ sender: UILongPressGestureRecognizer) {
        self.delegate?.cellLongTapped(index: index, id: MemoManager.shared.memos[index].id)
    }
}
