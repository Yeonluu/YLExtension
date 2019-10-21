//
//  UIView+Frame.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/20.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension UIView {
    
    open var x: CGFloat {
        set {
            var newFrame = frame
            newFrame.origin.x = newValue
            frame = newFrame
        }
        get {
            return frame.origin.x
        }
    }
    
    open var y: CGFloat {
        set {
            var newFrame = frame
            newFrame.origin.y = newValue
            frame = newFrame
        }
        get {
            return frame.origin.y
        }
    }
    
    open var width: CGFloat {
        set {
            var newFrame = frame
            newFrame.size.width = newValue
            frame = newFrame
        }
        get {
            return frame.width
        }
    }
    
    open var height: CGFloat {
        set {
            var newFrame = frame
            newFrame.size.height = newValue
            frame = newFrame
        }
        get {
            return frame.height
        }
    }
    
    open var centerX: CGFloat {
        set {
            var newCenter = center
            newCenter.x = newValue
            center = newCenter
        }
        get {
            return center.x
        }
    }
    
    open var centerY: CGFloat {
        set {
            var newCenter = center
            newCenter.y = newValue
            center = newCenter
        }
        get {
            return center.y
        }
    }
    
    public convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }
    
}

extension YLExtension where Base: UIView {
    
    public func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            base.addSubview(view)
        }
    }
}
