//
//  UIFont+Init.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/7/3.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

extension UIFont {
    
    open class func mediumSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return self.systemFont(ofSize: fontSize, weight: UIFont.Weight.medium)
    }

}
