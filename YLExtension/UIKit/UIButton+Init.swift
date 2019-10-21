//
//  UIButton+Init.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/19.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIButton {
    
    private convenience init(eventHandler: VoidBlock? = nil) {
        self.init(type: .custom)
        if let eventHandler = eventHandler {
            _ = self.rx.tap.subscribe(onNext: {
                eventHandler()
            })
        }
    }
    
    /// 创建普通文字按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - font: 字体
    ///   - color: 字色
    ///   - eventHandler: 点击事件回调
    public convenience init(title: String, font: UIFont, color: UIColor, eventHandler: VoidBlock? = nil) {
        self.init(eventHandler: eventHandler)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(color, for: .normal)
    }
    
    /// 创建普通图标按钮
    ///
    /// - Parameters:
    ///   - imageNamed: 本地图片名
    ///   - eventHandler: 点击事件回调
    public convenience init(imageNamed: String, eventHandler: VoidBlock? = nil) {
        self.init(eventHandler: eventHandler)
        if !imageNamed.isEmpty {
            self.setImage(UIImage.init(named: imageNamed), for: .normal)
            self.adjustsImageWhenHighlighted = false
        }
    }
    
    /// 创建带圆角的线框背景文字按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - font: 字体
    ///   - color: 字色
    ///   - cornerRadius: 圆角 默认为4
    ///   - borderWidth: 边框线 默认为1
    ///   - borderColor: 边框色 默认为字色
    ///   - eventHandler: 点击事件回调 roundCorner
    public convenience init(roundStyleWithTitle title: String, font: UIFont, color: UIColor, cornerRadius: CGFloat = 4, borderWidth: CGFloat = 1, borderColor: UIColor? = nil, eventHandler: VoidBlock? = nil) {
        self.init(title: title, font: font, color: color, eventHandler: eventHandler)
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor ?? color.cgColor
    }
    
    /// 创建带圆角的纯色背景文字按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - font: 字体
    ///   - backgroundColor: 背景颜色
    ///   - cornerRadius: 圆角 默认为4
    ///   - eventHandler: 点击事件回调
    public convenience init(roundStyleWithTitle title: String, font: UIFont, backgroundColor: UIColor, cornerRadius: CGFloat = 4, eventHandler: VoidBlock? = nil) {
        self.init(title: title, font: font, color: .white, eventHandler: eventHandler)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
   
}
