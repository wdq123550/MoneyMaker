//
//  MMSwitch.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit

open class MMSwitch: UISwitch {
    
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
        case onTintColor(UIColor)
        case thumbTintColor(UIColor)
        case onImage(UIImage)
        case offImage(UIImage)
    }
    
    //MARK: - private
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMSwitch {
        switch attribute {
        case.onTintColor(let onTintColor):
            self.onTintColor = onTintColor
        case.thumbTintColor(let thumbTintColor):
            self.thumbTintColor = thumbTintColor
        case.onImage(let onImage):
            self.onImage = onImage
        case.offImage(let offImage):
            self.offImage = offImage
        }
        return self
    }
}
