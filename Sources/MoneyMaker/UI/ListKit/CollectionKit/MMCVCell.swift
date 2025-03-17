//
//  MMCVCell.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit
open class MMCVCellVM: NSObject, MMCVCellVMProtocol {
    open var cellType: any MMCVCellProtocol.Type{ MMCVCell.self }
    public var indexPath: IndexPath?
    public var cellSize: CGSize?
}

open class MMCVCell: UICollectionViewCell, MMCVCellProtocol {
    
    //MARK: - init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        let tapGes = UITapGestureRecognizer()
        tapGes.reactive.stateChanged.take(duringLifetimeOf: self).observeValues { [unowned self] tapGes in
            self.onClickContentView()
        }
        self.contentView.addGestureRecognizer(tapGes)
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - open
    open func onClickContentView() {}
    open func reset(with cellVM: any MMCVCellVMProtocol, indexPath: IndexPath) {
        self._viewModel = cellVM as? MMCVCellVM
        self._viewModel?.indexPath = indexPath
    }
    open class func cellSize(with cellVM: any MMCVCellVMProtocol, indexPath: IndexPath) -> CGSize {
        cellVM.indexPath = indexPath
        return cellVM.cellSize ?? .zero
    }
    //MARK: - public
    public var _viewModel: MMCVCellVM?
}
