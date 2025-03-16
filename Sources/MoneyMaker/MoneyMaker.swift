// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
 $(SRCROOT)//这个有个坑，有个空格在前面复制过去报错，日了狗了，记录一下
 */

import Foundation
import UIKit
import Alamofire
import SwiftHEXColors
import JGProgressHUD
import SVProgressHUD
import SnapKit
import MJRefresh
import WCDBSwift
import RSKGrowingTextView
import IQKeyboardManagerSwift
import ReactiveSwift
import ReactiveCocoa

//MARK: - 尺寸
@MainActor public let mainScreenBounds = UIScreen.main.bounds
@MainActor public let mainScreenWidth = mainScreenBounds.width
@MainActor public let mainScreenHeight = mainScreenBounds.height
@MainActor public let widthScale = mainScreenWidth / 375.0
@MainActor public let heightScale = mainScreenHeight / 812.0

//MARK: - 颜色
public func Color(_ hex: String, alpha: Float? = nil) -> UIColor {
    UIColor(hexString: hex, alpha: alpha)!
}

//MARK: - 字体
public func FontSystem(size: CGFloat, weight: UIFont.Weight) -> UIFont {
    UIFont.systemFont(ofSize: size, weight: weight)
}

public func FontCustom(fontName: String, size: CGFloat) -> UIFont {
    UIFont(name: fontName, size: size)!
}

//MARK: - keyWindow
@MainActor public let keyWindow: UIWindow = {
    guard let window = UIApplication.shared.delegate?.window else {
        fatalError("Key window not available")
    }
    return window!
}()
