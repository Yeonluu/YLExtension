//
//  UIResponder+First.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/20.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

fileprivate var findTimes = 0

extension YLExtension where Base: UIResponder {
    
    /// 获取当前控制器
    public var currentViewController: UIViewController? {
        get {
            let controller = self.findFirstController(withClass: UIViewController.self)
            return controller
        }
    }
    
    /// 获取当前导航栏控制器
    public var currentNavigationContoller: UINavigationController? {
        get {
//            UIApplication.shared.delegate?.window??.rootViewController
            let controller = self.findFirstController(withClass: UINavigationController.self) as? UINavigationController
            return controller
        }
    }
    
    private func findFirstController(withClass aClass: AnyClass) -> UIViewController? {        
        return self.findFirstResponder(with: base.next, class: aClass) as? UIViewController
    }

    private func findFirstResponder(with responder: UIResponder?, class aClass: AnyClass) -> UIResponder? {
        
        guard let responder = responder else {
            return nil
        }
        
        if findTimes >= 15 { // 最多只查找15次
            findTimes = 0
            return nil
        }
        
        if responder.isKind(of: aClass) {
            findTimes = 0
            return responder
        }
        
        findTimes += 1
        return findFirstResponder(with: responder.next, class: aClass)
    }
    
}
