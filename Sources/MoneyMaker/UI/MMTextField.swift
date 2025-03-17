//
//  MMTextField.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//
import UIKit

open class MMTextField: UITextField {
    
    //MARK: - init
    public init(_ attributes: Attribute...){
        super.init(frame: .zero)
        for attribute in attributes {
            self.addAttribute(attribute)
        }
        self.addAutoRightDeleteIcon()
    }
    
    //MARK: - public
    public enum Attribute {
        case font(UIFont)
        case text(String)
        case textColor(UIColor)
        case attributedText(NSAttributedString)
        case textAlignment(NSTextAlignment)
        case placeholder(String)
        case attributedPlaceholder(NSAttributedString)
        case bgColor(UIColor)
        case leftView(MMView)
        case leftViewMode(UITextField.ViewMode)
        case rightView(MMView)
        case rightViewMode(UITextField.ViewMode)
        case layerSet(LayerSet)
        case autoRightDelete(UIImage, CGFloat = 10.0)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - private
    private var autoRightDeleteImage: UIImage?
    private var rightViewStepMargin: CGFloat = 10.0
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMTextField {
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
        case.attributedText(let attributeString):
            self.attributedText = attributeString
        case.placeholder(let placeholder):
            self.placeholder = placeholder
        case.attributedPlaceholder(let attributePlaceholder):
            self.attributedPlaceholder = attributePlaceholder
        case.leftView(let leftView):
            self.leftView = leftView
        case.rightView(let rightView):
            self.rightView = rightView
        case.leftViewMode(let leftViewMode):
            self.leftViewMode = leftViewMode
        case.rightViewMode(let rightViewMode):
            self.rightViewMode = rightViewMode
        case .autoRightDelete(let rightDeleteImage, let rightViewStepMargin):
            self.autoRightDeleteImage = rightDeleteImage
            self.rightViewStepMargin = rightViewStepMargin
            break
        }
        return self
    }
    
    private func addAutoRightDeleteIcon() {
        if let autoRightDeleteImage = self.autoRightDeleteImage, self.rightView == nil {
            let width = autoRightDeleteImage.size.width
            let height = autoRightDeleteImage.size.height
            let rightView = MMView(frame: .init(x: 0, y: 0, width: width + self.rightViewStepMargin * 2, height: height))
            self.rightView = rightView
            self.rightViewMode = .whileEditing
            let btn = MMButton(
                .buttonItem(.init(image: autoRightDeleteImage, state: .normal))
            )
            rightView.addSubview(btn)
            btn.frame = .init(x: self.rightViewStepMargin, y: 0, width: btn.currentImage?.size.width ?? 0, height: btn.currentImage?.size.height ?? 0)
            btn.addAction(UIAction(handler: { [unowned self] _ in
                self.text = ""
            }), for: .touchUpInside)
            self.reactive.continuousTextValues.take(duringLifetimeOf: self).observeValues { [unowned self] text in
                self.rightViewMode = text.count > 0 ? .whileEditing : .never
            }
        }
    }
}

