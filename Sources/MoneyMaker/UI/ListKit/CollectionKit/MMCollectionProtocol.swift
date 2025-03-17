//
//  MMCollectionProtocol.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import Foundation
import UIKit
public protocol MMCVCellVMProtocol: AnyObject {
    var cellSize: CGSize? {get set}
    var indexPath: IndexPath? {get set}
    var cellType: MMCVCellProtocol.Type {get}
}

public protocol MMCVCellProtocol: UICollectionViewCell{
    func reset(with cellVM: MMCVCellVMProtocol, indexPath: IndexPath)
    static func cellSize(with cellVM: MMCVCellVMProtocol, indexPath: IndexPath) -> CGSize
}
