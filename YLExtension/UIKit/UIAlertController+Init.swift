//
//  UIAlertController+Init.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/20.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension UIAlertController {

    /// 快速显示AlertController
    /// 必有“取消”选项，(doneTitle != nil || doneBlock != nil) 展示“确定”选项
    ///
    /// - Parameters:
    ///   - message: 内容信息
    ///   - doneTitle: 确定按钮标题
    ///   - doneBlock: 确定事件回调
    ///   - cancelTitle: 取消按钮标题 默认为“取消”
    ///   - cancelBlock: 取消事件回调
    public class func show(message: String, doneTitle: String? = nil, doneHandler: VoidBlock? = nil, cancelTitle: String? = nil, cancelHandler: VoidBlock? = nil) {
        
        dismissVisibleAlertController()
        let alertController = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        AlertManager.shared.visibleAlertController = alertController
        
        alertController.addAction(UIAlertAction.init(title: cancelTitle ?? "取消", style: .cancel, handler: { (_) in
            cancelHandler?()
            dismissVisibleAlertController()
        }))
        
        if doneTitle != nil || doneHandler != nil {
            alertController.addAction(UIAlertAction.init(title: doneTitle ?? "确定", style: .default, handler: { (_) in
                dismissVisibleAlertController()
                doneHandler?()
            }))
        }
        alertController.show()
    }

    
    /// 显示
    private func show() {
        let win = UIWindow.init(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = .alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
        // ViewControllerHelper.visibleViewController?.present(self, animated: true, completion: nil)
    }
    
    /// 消失
    private func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

    private class func dismissVisibleAlertController() {
        AlertManager.shared.visibleAlertController?.dismiss()
        AlertManager.shared.visibleAlertController = nil
    }
    
    /// 快速显示带输入框的AlertController
    ///
    /// - Parameters:
    ///   - configuration: 输入框配置回调
    ///   - title: 标题
    ///   - doneTitle: 确定按钮标题
    ///   - doneHandler: 确定事件回调
    public class func showTextField(_ configuration: @escaping ((UITextField)->Void), title: String, doneTitle: String? = nil, doneHandler: ((String?)->Void)? = nil) {
        
        let alertController = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            configuration(textField)
        }
        alertController.addAction(UIAlertAction.init(title:"取消", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction.init(title: doneTitle ?? "确定", style: .default, handler: { (_) in
            doneHandler?(alertController.textFields?.first?.text)
        }))
        alertController.show()
    }
    
}
