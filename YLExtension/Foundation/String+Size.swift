//
//  NSString+Size.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/19.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import Foundation
import UIKit

extension YLExtension where Base: NSString {
    
    private func getSize(withFont font: UIFont, limitSize: CGSize) -> CGSize {
        let strSize = self.base.boundingRect(with: limitSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil).size
        return strSize
    }
    
    public func getWidth(withFont font: UIFont, limitHeight: CGFloat) -> CGFloat {
        return self.getSize(withFont: font, limitSize: CGSize(width: CGFloat.greatestFiniteMagnitude, height: limitHeight)).width
    }
    
    public func getHeight(withFont font: UIFont, limitWidth: CGFloat) -> CGFloat {
        return self.getSize(withFont: font, limitSize: CGSize(width: limitWidth, height: CGFloat.greatestFiniteMagnitude)).height
    }
}

extension YLExtension where Base: NSAttributedString {
    
    private func getSize(withLimitSize limitSize: CGSize) -> CGSize {
        let strSize = self.base.boundingRect(with: limitSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).size
        return strSize
    }
    
    public func getWidth(withLimitHeight limitHeight: CGFloat) -> CGFloat {
        return self.getSize(withLimitSize: CGSize(width: CGFloat.greatestFiniteMagnitude, height: limitHeight)).width
    }
    
    public func getHeight(withLimitWidth limitWidth: CGFloat) -> CGFloat {
        return self.getSize(withLimitSize: CGSize(width: limitWidth, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
}
