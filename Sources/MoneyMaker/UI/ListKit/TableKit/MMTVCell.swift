//
//  MMTVCell.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit
import Combine
import ReactiveCocoa
open class MMTVCellVM: NSObject, MMTVCellVMProtocol{
    
    public var cellHeight: CGFloat?
    public var indexPath: IndexPath?
    open var cellType: any MMTVCellProtocol.Type{ MMTVCell.self }
    public let clickSubject = PassthroughSubject<Int, Never>()
    public var cancellables = Set<AnyCancellable>()
}

open class MMTVCell: UITableViewCell, MMTVCellProtocol {
    
    //MARK: - init
    public required init(reuserID: String) {
        super.init(style: .default, reuseIdentifier: reuserID)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        let tapGes = UITapGestureRecognizer()
        self.contentView.addGestureRecognizer(tapGes)
        tapGes.reactive.stateChanged.take(duringLifetimeOf: self).observeValues { [unowned self] tapGes in
            self.onClickContentView()
        }
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - open
    open func reset(with cellVM: MMTVCellVMProtocol, indexPath: IndexPath) {
        self._viewModel = cellVM as? MMTVCellVM
        self._viewModel?.indexPath = indexPath
    }
    open class func cellHeight(with cellVM: MMTVCellVMProtocol, indexPath: IndexPath) -> CGFloat {
        cellVM.indexPath = indexPath
        return cellVM.cellHeight ?? 0
    }
    open func onClickContentView() {}
    
    //MARK: - public
    public var _viewModel: MMTVCellVM?
}

