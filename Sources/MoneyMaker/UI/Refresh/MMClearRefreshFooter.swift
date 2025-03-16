//
//  MMClearRefreshFooter.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//  非常干净的取消了各种提示的上拉加载控件，如果需要原本的信息，请子类化此类进行设置

import UIKit
import MJRefresh

public class MMClearRefreshFooter: MJRefreshAutoFooter {

    public init(refreshingClosure: @escaping MJRefreshComponentAction) {
        super.init(frame: .zero)
        self.refreshingBlock = refreshingClosure
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
