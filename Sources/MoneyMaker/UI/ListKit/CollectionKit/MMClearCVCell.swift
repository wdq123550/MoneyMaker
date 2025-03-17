//
//  MMClearCVCell.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit
public final class MMClearCVCellVM: MMCVCellVM {
    public override var cellType: any MMCVCellProtocol.Type{ MMClearCVCell.self }
    public var bgColor: UIColor = .clear
    public init(bgColor: UIColor) { self.bgColor = bgColor }
}
public final class MMClearCVCell: MMCVCell {
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - public
    public override func reset(with cellVM: any MMCVCellVMProtocol, indexPath: IndexPath) {
        super.reset(with: cellVM, indexPath: indexPath)
        self.backgroundColor = self.viewModel.bgColor
    }
    public override class func cellSize(with cellVM: any MMCVCellVMProtocol, indexPath: IndexPath) -> CGSize {
        super.cellSize(with: cellVM, indexPath: indexPath)
    }
    
    //MARK: - private
    private var viewModel: MMClearCVCellVM{
        set{ _viewModel = newValue }
        get{ _viewModel as! MMClearCVCellVM }
    }
}
