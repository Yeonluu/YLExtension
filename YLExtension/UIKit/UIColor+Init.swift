//
//  UIColor+Init.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/20.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func RGB(_ rgb: CGFloat) -> UIColor {
        return UIColor.init(red: rgb/255, green: rgb/255, blue: rgb/255, alpha: 1)
    }
    
    class func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    class func RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    convenience init(hexValue: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat(((hexValue & 0xFF0000) >> 16)/255),
            green: CGFloat(((hexValue & 0xFF0000) >> 16)/255),
            blue: CGFloat(((hexValue & 0xFF0000) >> 16)/255),
            alpha: alpha)
    }
    
    class func randomColor() -> UIColor {
        return UIColor.RGB(CGFloat(arc4random_uniform(256)), CGFloat(arc4random_uniform(256)), CGFloat(arc4random_uniform(256)))
    }
    
}

