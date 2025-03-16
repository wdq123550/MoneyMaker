//
//  MMTextView.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//
import UIKit
import RSKGrowingTextView

public class MMTextView: RSKGrowingTextView {
    
    public enum Attribute {
        case font(UIFont)
        case text(String)
        case textColor(UIColor)
        case attributedText(NSAttributedString)
        case textAlignment(NSTextAlignment)
        case placeholder(String)
        case attributedPlaceholder(NSAttributedString)
        case bgColor(UIColor)
        case layerSet(LayerSet)
        case linkTapGestureRecognizer(NSAttributedString, linkColor: UIColor, (URL) -> Void)
    }
    
    public static var deleteImage: UIImage = UIImage(named: "textFieldDelete")!
    
    public init(_ attributes: Attribute...){
        super.init(frame: .zero, textContainer: nil)
        for attribute in attributes {
            self.addAttribute(attribute)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMTextView {
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
            self.placeholder = placeholder as NSString
        case.attributedPlaceholder(let attributePlaceholder):
            self.attributedPlaceholder = attributePlaceholder
        case.linkTapGestureRecognizer(let attributedText, let linkColor, let function):
            self.showsVerticalScrollIndicator = false
            self.showsHorizontalScrollIndicator = false
            self.isEditable = false
            self.linkTextAttributes = [.foregroundColor: linkColor]
            self.textContainerInset = .zero
            self.attributedText = attributedText
            let tapGes = UITapGestureRecognizer()
            self.addGestureRecognizer(tapGes)
            tapGes.reactive.stateChanged.take(duringLifetimeOf: self).observeValues { [unowned self] tapGes in
                let tapLocation = (tapGes as UITapGestureRecognizer).location(in: self)
                let textPosition = self.closestPosition(to: tapLocation)
                if let textPosition {
                    let dict = self.textStyling(at: textPosition, in: .forward)
                    let link = dict?[NSAttributedString.Key.link]
                    if let link {
                        function(link as! URL)
                    }
                }
            }
        }
        return self
    }
}
