//
//  CustomUIButton.swift
//  CollectionApp
//
//  Created by 栗須星舞 on 2020/12/23.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit

@IBDesignable class CustomUIButton: UIButton {
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
    }
}
