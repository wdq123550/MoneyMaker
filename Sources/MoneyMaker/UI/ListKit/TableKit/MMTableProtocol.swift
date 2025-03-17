//
//  MMTableProtocol.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit

public protocol MMTVCellVMProtocol: AnyObject {
    var cellHeight: CGFloat? {get set}
    var indexPath: IndexPath? {get set}
    var cellType: MMTVCellProtocol.Type {get}
}

public protocol MMTVCellProtocol: UITableViewCell{
    init(reuserID: String)
    func reset(with cellVM: MMTVCellVMProtocol, indexPath: IndexPath)
    static func cellHeight(with cellVM: MMTVCellVMProtocol, indexPath: IndexPath) -> CGFloat
}
