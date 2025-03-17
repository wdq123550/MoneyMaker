//
//  MMClearTVCell.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit

public final class MMClearTVCellVM: MMTVCellVM {
    public override var cellType: any MMTVCellProtocol.Type{ MMClearTVCell.self }
    public var bgColor: UIColor = .clear
    public init(bgColor: UIColor) {
        self.bgColor = bgColor
        super.init()
    }
}

public final class MMClearTVCell: MMTVCell {
    
    //MARK: - init
    required init(reuserID: String) {
        super.init(reuserID: reuserID)
    }
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - public
    public override func reset(with cellVM: any MMTVCellVMProtocol, indexPath: IndexPath) {
        super.reset(with: cellVM, indexPath: indexPath)
        self.backgroundColor = self.viewModel.bgColor
    }
    public override class func cellHeight(with cellVM: any MMTVCellVMProtocol, indexPath: IndexPath) -> CGFloat {
        cellVM.cellHeight ?? 0
    }
    
    //MARK: - private
    private var viewModel: MMClearTVCellVM {
        set { self._viewModel = newValue }
        get { self._viewModel as! MMClearTVCellVM }
    }
}
