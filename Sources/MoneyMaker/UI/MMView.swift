//
//  MMView.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit
import Combine

open class MMView: UIView{
    
    
    //MARK: - init
    public init(_ attributes: Attribute...){
        super.init(frame: .zero)
        for attribute in attributes {
            self.addAttribute(attribute)
        }
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    //MARK: - public
    public var cancellables = Set<AnyCancellable>()
    
    public enum Attribute {
        case bgColor(UIColor)
        case layerSet(LayerSet)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - private
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMView {
        switch attribute {
        case .bgColor(let bgColor):
            self.backgroundColor = bgColor
        case .layerSet(let layerSet):
            self.layer.cornerRadius = layerSet.cornerRadius ?? 0
            self.layer.borderWidth = layerSet.borderWidth ?? 0
            self.layer.borderColor = layerSet.borderColor?.cgColor
            self.clipsToBounds = true
        }
        return self
    }
}

