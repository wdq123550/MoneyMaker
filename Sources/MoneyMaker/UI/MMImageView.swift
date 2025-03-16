//
//  MMImageView.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit

public class MMImageView: UIImageView {

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
        case contentMode(UIView.ContentMode)
        case image(UIImage)
        case layerSet(LayerSet)
        case tapGestureRecognizer( (_ tapGestureRecognizer: UITapGestureRecognizer) -> () )
    }
    
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMImageView {
        switch attribute {
        case .contentMode(let contentMode):
            self.contentMode = contentMode
        case.image(let image):
            self.image = image
        case.layerSet(let layerSet):
            self.layer.cornerRadius = layerSet.cornerRadius ?? 0
            self.layer.borderWidth = layerSet.borderWidth ?? 0
            self.layer.borderColor = layerSet.borderColor?.cgColor
            self.clipsToBounds = true
        case.tapGestureRecognizer(let function):
            self.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer()
            self.addGestureRecognizer(tapGes)
            tapGes.reactive.stateChanged.take(duringLifetimeOf: self).observeValues { tapGes in
                function(tapGes)
            }
        }
        return self
    }
    
}

