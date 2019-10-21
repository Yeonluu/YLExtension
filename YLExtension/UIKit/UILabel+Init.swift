//
//  UILabel+Init.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/19.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension UILabel {
    
    public convenience init(font: UIFont, textColor: UIColor, text: String? = nil, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.text = text
        self.textAlignment = textAlignment
    }
}
