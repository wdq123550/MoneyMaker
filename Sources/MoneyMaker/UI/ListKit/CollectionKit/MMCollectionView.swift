//
//  MMCollectionView.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit

public final class MMCollectionView: UICollectionView {
    
    //MARK: - init
    public init(extensionTarget: AnyObject,
                layout: UICollectionViewLayout,
                cellClasses: [UICollectionViewCell.Type]
    ){
        self.proxy = MMCollectionProxy(extensionTarget: extensionTarget)
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = .clear
        for cls in cellClasses {
            let reuseIdentifier = String(describing: cls)
            self.register(cls, forCellWithReuseIdentifier: reuseIdentifier)
        }
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - public
    public func reload(with datas: [Any], animation: Bool = false) {
        if self.delegate == nil { self.delegate = self.proxy }
        if self.dataSource == nil { self.dataSource = self.proxy }
        
        self.proxy.reload(datas: datas)
        UIView.transition(with: self, duration: 0.25, options: animation ? .transitionCrossDissolve : .layoutSubviews, animations: {
            self.reloadData()
        })
        
        if self.mj_header != nil { self.mj_header?.endRefreshing() }
        if self.mj_footer != nil { self.mj_footer?.endRefreshing() }
    }
    
    //MARK: - private
    private var proxy: MMCollectionProxy
    
}
