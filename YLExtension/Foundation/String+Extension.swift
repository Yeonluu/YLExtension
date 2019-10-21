//
//  String+SubString.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/19.
//  Copyright © 2019年 Yeonluu. All rights reserved.
//

import Foundation

extension YLExtension where Base == String {

    public func substring(from index: Int) -> String {
        guard self.base.count > index else {
            return self.base
        }
        let startIndex = self.base.index(self.base.startIndex, offsetBy: index)
        let subString = self.base[startIndex...]
        return String(subString)
    }
    
    public func substring(to index: Int) -> String {
        guard self.base.count > index else {
            return self.base
        }
        let endIndex = self.base.index(self.base.startIndex, offsetBy: index)
        let subString = self.base[..<endIndex]
        return String(subString)
    }
    
    public func substring(with range: CountableClosedRange<Int>) -> String {
        return self.substring(to: range.upperBound).yl.substring(from: range.lowerBound)
    }
}

// init
extension String {
    
    init?(_ value: Any?) {
        if let intV = value as? Int {
            self.init(intV)
        }
        else if let doubleV = value as? Double {
            self.init(doubleV)
        }
        else if let stringV = value as? String {
            self.init(stringV)
        }
        else {
            self.init()
        }
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }
    
    var doubleValue: Double {
        return Double(self) ?? 0
    }
    
    var floatValue: Float {
        return Float(self) ?? 0
    }
}

