//
//  MMLabel.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit

public class MMLabel: UILabel {
    
    
    public init(_ attributes: Attribute...){
        super.init(frame: .zero)
        for attribute in attributes {
            self.addAttribute(attribute)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public enum Attribute {
        case text(String)
        case textColor(UIColor)
        case font(UIFont)
        case bgColor(UIColor)
        case textAlignment(NSTextAlignment)
        case layerSet(LayerSet)
        case numberOfLine(Int)
        case lineBreakMode(NSLineBreakMode)
        case attributeText(NSAttributedString)
    }
    
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMLabel {
        switch attribute {
        case.text(let text):
            self.text = text
        case.textColor(let textColor):
            self.textColor = textColor
        case.font(let font):
            self.font = font
        case.bgColor(let bgColor):
            self.backgroundColor = bgColor
        case.textAlignment(let textAlignment):
            self.textAlignment = textAlignment
        case.layerSet(let layerSet):
            self.layer.cornerRadius = layerSet.cornerRadius ?? 0
            self.layer.borderWidth = layerSet.borderWidth ?? 0
            self.layer.borderColor = layerSet.borderColor?.cgColor
            self.clipsToBounds = true
        case.numberOfLine(let numberOfLine):
            self.numberOfLines = numberOfLine
        case.lineBreakMode(let lineBreakMode):
            self.lineBreakMode = lineBreakMode
        case.attributeText(let attributeText):
            self.attributedText = attributeText
        }
        return self
    }
    
}

