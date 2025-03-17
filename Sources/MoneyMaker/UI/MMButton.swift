//
//  MMButton.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit

open class MMButton: UIButton {
    
    //MARK: - 构造方法
    public init(_ attributes: Attribute...) {
        super.init(frame: .zero)
        
        for attribute in attributes {
            self.addAttribute(attribute)
        }
        
        let normalButtonItem = self.buttonItems.filter {
            $0.state == .normal
        }
        
        self.applyButtonItem(buttonItem: normalButtonItem.first!)
    }
    
    //MARK: - public
    public struct ButtonItem {
        var font: UIFont?
        var title: String?
        var titleColor: UIColor?
        var image: UIImage?
        var imagePosition: NSDirectionalRectEdge?
        var spacing: CGFloat?
        var bgColor: UIColor?
        var state: UIControl.State
    }
    
    public enum Attribute {
        case buttonItem(ButtonItem)
        case layerSet(LayerSet)
        case isUserInteractionEnabled(Bool)
        case isDisableHighlighted(Bool = true)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var isHighlighted: Bool {
        get { return self.isDisableHighlighted }
        set { /* 空实现，阻止高亮状态设置 */ }
    }
    
    public override var state: UIControl.State{
        get{
            self._state
        }
        set {
            _state = newValue
        }
    }
    
    //MARK: - private
    private var buttonItems = [ButtonItem]()
    private var isDisableHighlighted = true
    private var _state: UIControl.State = .normal{
        didSet{
            for buttonItem in buttonItems {
                if buttonItem.state == _state {
                    self.applyButtonItem(buttonItem: buttonItem)
                }
            }
        }
    }
    
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMButton {
        switch attribute {
        case .buttonItem(let buttonItem):
            self.buttonItems.append(buttonItem)
        case .isDisableHighlighted(let isDisableHighlighted):
            self.isDisableHighlighted = isDisableHighlighted
        case .isUserInteractionEnabled(let isUserInteractionEnabled):
            self.isUserInteractionEnabled = isUserInteractionEnabled
        case .layerSet(let layerSet):
            self.layer.cornerRadius = layerSet.cornerRadius ?? 0
            self.layer.borderWidth = layerSet.borderWidth ?? 0
            self.layer.borderColor = layerSet.borderColor?.cgColor
            self.clipsToBounds = true
        }
        return self
    }
    
    private func applyButtonItem(buttonItem: ButtonItem) {
        var config = UIButton.Configuration.plain()
        config.contentInsets = .zero
        config.title = buttonItem.title
        config.baseForegroundColor = buttonItem.titleColor
        config.image = buttonItem.image
        config.imagePlacement = buttonItem.imagePosition ?? .leading
        config.imagePadding = buttonItem.spacing ?? 0
        config.background.backgroundColor = buttonItem.bgColor ?? .clear
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = buttonItem.font
            return outgoing
        }
        self.configuration = config
    }
    
}

