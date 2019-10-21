//
//  String+SubString.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/19.
//  Copyright © 2019年 Yeonluu. All rights reserved.
//

import Foundation

extension YLExtension where Base == Double {
    /// 自动移除小数点后多余的0  1.100 -> 1.1
    var roundingStringValue: String {
        var string = String(format: "%.2f", self.base)
        if string.hasSuffix("0") { // 8.00 —> 8.0
            string = string.yl.substring(to: string.count-1)
            if string.hasSuffix("0") { // 8.0 -> 8
                string = string.yl.substring(to: string.count-2)
            }
        }
        return string
    }
    
    /// 自动移除小数点后多余的0，拼接¥  1.100 -> ¥1.1
    var priceStringValue: String {
        return "¥" + self.roundingStringValue
    }
}


// priceString
extension YLExtension where Base == String {

    /// 自动移除小数点后多余的0  1.100 -> 1.1
    var roundingStringValue: String {
        return self.base.doubleValue.yl.roundingStringValue
    }
    
    /// 自动移除小数点后多余的0，拼接¥  1.100 -> ¥1.1
    var priceStringValue: String {
        return self.base.doubleValue.yl.priceStringValue
    }
}
