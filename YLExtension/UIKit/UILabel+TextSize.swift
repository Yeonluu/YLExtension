//
//  UILabel+TextSize.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/19.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension YLExtension where Base: UILabel {
    
    /// 文本宽度
    public var textWidth: CGFloat {
        guard let text = base.text else {
            return 0
        }
        return (text as NSString).yl.getWidth(withFont: base.font, limitHeight: base.frame.height)
    }
    
    /// 文本高度
    public var textHeight: CGFloat {
        guard let text = base.text else {
            return 0
        }
        return (text as NSString).yl.getHeight(withFont: base.font, limitWidth: base.frame.width)
    }
    
    /// 富文本宽度 注意设置font
    public var attributedTextWidth: CGFloat {
        guard let attributedText = base.attributedText else {
            return 0
        }
        return attributedText.yl.getWidth(withLimitHeight: base.frame.height)
    }
    
    /// 富文本高度 注意设置font
    public var attributedTextHeight: CGFloat {
        guard let attributedText = base.attributedText else {
            return 0
        }
        return attributedText.yl.getHeight(withLimitWidth: base.frame.width)
    }
    
}
