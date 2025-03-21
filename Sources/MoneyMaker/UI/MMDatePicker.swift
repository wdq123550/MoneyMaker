//
//  MMDatePicker.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import UIKit

open class MMDatePicker: UIDatePicker {

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
        case minimumDate(Date)
        case maximumDate(Date)
        case date(Date)
        case datePickerStyle(UIDatePickerStyle = .wheels)
    }
    
    
    //MARK: - private
    @discardableResult private func addAttribute(_ attribute: Attribute) -> MMDatePicker {
        switch attribute {
        case.date(let date):
            self.date = date
        case.minimumDate(let minimumDate):
            self.minimumDate = minimumDate
        case.maximumDate(let maximumDate):
            self.maximumDate = maximumDate
        case.datePickerStyle(let datePickerStyle):
            self.preferredDatePickerStyle = datePickerStyle
        }
        return self
    }
    
}

