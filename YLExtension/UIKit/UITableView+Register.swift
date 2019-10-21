//
//  UITableView+Register.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/20.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension YLExtension where Base: UITableView {

    public func registerCell(_ cellClass: AnyClass) {
        base.register(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
 
    public func registerCell(_ cellClasses: [AnyClass]) {
        for aClass in cellClasses {
            self.registerCell(aClass)
        }
    }
    
    public func registerHeaderFooterView(_ viewClass: AnyClass) {
        base.register(viewClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    public func registerHeaderFooterView(_ viewClasses: [AnyClass]) {
        for aClass in viewClasses {
            self.registerHeaderFooterView(aClass)
        }
    }
    
    public func dequeueReusableCell(_ cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
        return base.dequeueReusableCell(withIdentifier: NSStringFromClass(cellClass), for: indexPath)
    }

    public func dequeueReusableHeaderFooterView(_ viewClass: AnyClass) -> UITableViewHeaderFooterView? {
        return base.dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(viewClass))
    }
}


extension UITableView {
    
    convenience init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, style: UITableView.Style = .plain) {
        self.init(frame: .zero, style: style)
        self.delegate = delegate
        self.dataSource = dataSource
        self.separatorStyle = .none
        self.keyboardDismissMode = .onDrag
        self.rowHeight = 44
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
            self.estimatedRowHeight = 0
            self.estimatedSectionHeaderHeight = 0
            self.estimatedSectionFooterHeight = 0
        }
    }
    
}
