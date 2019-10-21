//
//  ExtensionProtocol.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/7/1.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

public protocol YLExtensionProtocol {
    associatedtype ExtensionType
    var yl: ExtensionType { get }
}

public extension YLExtensionProtocol {
    var yl: YLExtension<Self> {
        return YLExtension(self)
    }
}

public final class YLExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

extension NSString: YLExtensionProtocol {
    
}

extension NSAttributedString: YLExtensionProtocol {
    
}

extension String: YLExtensionProtocol {
    
}

extension Dictionary: YLExtensionProtocol {
    
}

extension Array: YLExtensionProtocol {
    
}

extension Double: YLExtensionProtocol {
    
}

extension UIView: YLExtensionProtocol {
    
}

extension Date: YLExtensionProtocol {
    
}





