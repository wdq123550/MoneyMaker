//
//  Button.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit
@_exported import MoneyMaker

class CellVM: MMTVCellVM {
    override var cellType: any MMTVCellProtocol.Type{
        Cell.self
    }
}

class Cell: MMTVCell {
    private var viewModel: CellVM {
        set {
            self._viewModel = newValue
        }
        get {
            self._viewModel as! CellVM
        }
    }
    
    required init(reuserID: String) {
        super.init(reuserID: reuserID)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func reset(with cellVM: any MMTVCellVMProtocol, indexPath: IndexPath) {
        super.reset(with: cellVM, indexPath: indexPath)
    }
    
    override class func cellHeight(with cellVM: any MMTVCellVMProtocol, indexPath: IndexPath) -> CGFloat {
        cellVM.cellHeight ?? 0
    }
}
