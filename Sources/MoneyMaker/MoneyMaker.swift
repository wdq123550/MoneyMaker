// The Swift Programming Language
// https://docs.swift.org/swift-book

/*
 $(SRCROOT)//这个有个坑，有个空格在前面复制过去报错，日了狗了，记录一下
 */

import Foundation
import UIKit
@_exported import Alamofire
@_exported import SwiftHEXColors
@_exported import JGProgressHUD
@_exported import SVProgressHUD
@_exported import SnapKit
@_exported import MJRefresh
@_exported import WCDBSwift
@_exported import RSKGrowingTextView
@_exported import IQKeyboardManagerSwift
@_exported import ReactiveSwift
@_exported import ReactiveCocoa

//MARK: - 尺寸
@MainActor let mainScreenBounds = UIScreen.main.bounds
@MainActor let mainScreenWidth = mainScreenBounds.width
@MainActor let mainScreenHeight = mainScreenBounds.height
@MainActor let widthScale = mainScreenWidth / 375.0
@MainActor let heightScale = mainScreenHeight / 812.0

//MARK: - 颜色
func Color(_ hex: String, alpha: Float? = nil) -> UIColor {
    UIColor(hexString: hex, alpha: alpha)!
}

//MARK: - 字体
func FontSystem(size: CGFloat, weight: UIFont.Weight) -> UIFont {
    UIFont.systemFont(ofSize: size, weight: weight)
}

func FontCustom(fontName: String, size: CGFloat) -> UIFont {
    UIFont(name: fontName, size: size)!
}

//MARK: - keyWindow
@MainActor let keyWindow: UIWindow = {
    guard let window = UIApplication.shared.delegate?.window else {
        fatalError("Key window not available")
    }
    return window!
}()
