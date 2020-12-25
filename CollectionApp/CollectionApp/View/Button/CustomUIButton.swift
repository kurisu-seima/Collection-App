//
//  CustomUIButton.swift
//  CollectionApp
//
//  Created by 栗須星舞 on 2020/12/23.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit

@IBDesignable class CustomUIButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        super.draw(rect)
    }
}
