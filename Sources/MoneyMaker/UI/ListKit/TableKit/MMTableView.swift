//
//  MMTableView.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit

public final class MMTableView: UITableView {
    
    //MARK: - init
    public init(style: UITableView.Style, extensionTarget: AnyObject){
        self.proxy = MMTableListProxy(extensionTarget: extensionTarget)
        super.init(frame: .zero, style: style)
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        }
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
    
    //MARK: - public
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    private let proxy: MMTableListProxy
    
}
