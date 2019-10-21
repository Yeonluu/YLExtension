//
//  UICollectionView+Register.swift
//  YLExtension
//
//  Created by Yeonluu on 2019/6/20.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

extension YLExtension where Base: UICollectionView {
    
    public func registerCell(_ cellClass: AnyClass) {
        base.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    public func registerCell(_ cellClasses: [AnyClass]) {
        for aClass in cellClasses {
            self.registerCell(aClass)
        }
    }
    
    public func registerHeaderView(_ viewClass: AnyClass) {
        base.register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    public func registerFooterView(_ viewClass: AnyClass) {
        base.register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(viewClass))
    }
    
    public func dequeueReusableCell(_ cellClass: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell {
        return base.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cellClass), for: indexPath)
    }
    
    public func dequeueReusableHeaderView(_ viewClass: AnyClass, for indexPath: IndexPath) -> UICollectionReusableView? {
        return base.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(viewClass), for: indexPath)
    }
    
    public func dequeueReusableFooterView(_ viewClass: AnyClass, for indexPath: IndexPath) -> UICollectionReusableView? {
        return base.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(viewClass), for: indexPath)
    }
}

extension UICollectionView {
    convenience init(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource, layout: UICollectionViewLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
        self.delegate = delegate
        self.dataSource = dataSource
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.keyboardDismissMode = .onDrag
        self.backgroundColor = .white
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}


extension UICollectionViewFlowLayout {
    
    convenience init(minimumLineSpacing: CGFloat = 0, minimumInteritemSpacing: CGFloat = 0, itemSize: CGSize = .zero, headerReferenceSize: CGSize = .zero, footerReferenceSize: CGSize = .zero) {
        self.init()
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.itemSize = itemSize
        self.headerReferenceSize = headerReferenceSize
        self.footerReferenceSize = footerReferenceSize
    }
}

