//
//  MMCVFlowLayout.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//

import UIKit
import ObjectiveC
open class MMCVFlowLayout: UICollectionViewFlowLayout {
    
    public override init() {
        super.init()
        let sel = NSSelectorFromString("_setRowAlignmentsOptions:")
        if self.responds(to: sel) {
            let method = unsafeBitCast(self.method(for: sel), to: (@convention(c) (AnyObject, Selector, NSDictionary) -> Void).self)
            method(self, sel, [
                "UIFlowLayoutCommonRowHorizontalAlignmentKey": NSTextAlignment.left.rawValue,
                "UIFlowLayoutLastRowHorizontalAlignmentKey": NSTextAlignment.left.rawValue,
                "UIFlowLayoutRowVerticalAlignmentKey": NSTextAlignment.center.rawValue
            ])
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
