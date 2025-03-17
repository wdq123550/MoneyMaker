//
//  MMScrollView.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit

open class MMScrollView: UIScrollView {
    
    //MARK: - init
    public init(_ attributes: Attribute...){
        super.init(frame: .zero)
        for attribute in attributes {
            self.addAttribute(attribute)
        }
    }
    
    //MARK: - public
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public enum Attribute {
        case contentSize(CGSize)
        case delegate(AnyObject)
        case pagingEnabled(Bool)
        case bounces(Bool)
        case showsVerticalScrollIndicator(Bool)
        case showsHorizontalScrollIndicator(Bool)
        case layerSet(LayerSet)
    }
    
    //MARK: - private
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMScrollView {
        switch attribute {
        case.contentSize(let contentSize):
            self.contentSize = contentSize
        case.delegate(let anyObject):
            self.delegate = (anyObject as! any UIScrollViewDelegate)
        case.pagingEnabled(let pagingEnabled):
            self.isPagingEnabled = pagingEnabled
        case.bounces(let bounces):
            self.bounces = bounces
        case .showsVerticalScrollIndicator(let showsVerticalScrollIndicator):
            self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        case.showsHorizontalScrollIndicator(let showsHorizontalScrollIndicator):
            self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        case.layerSet(let layerSet):
            self.layer.cornerRadius = layerSet.cornerRadius ?? 0
            self.layer.borderWidth = layerSet.borderWidth ?? 0
            self.layer.borderColor = layerSet.borderColor?.cgColor
            self.clipsToBounds = true
        }
        return self
    }
}

