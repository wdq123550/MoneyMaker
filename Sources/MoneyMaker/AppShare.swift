//
//  AppShare.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/17.
//


//MARK: - 尺寸
public let mainScreenBounds = UIScreen.main.bounds
public let mainScreenWidth = mainScreenBounds.width
public let mainScreenHeight = mainScreenBounds.height
public let widthScale = mainScreenWidth / 375.0
public let heightScale = mainScreenHeight / 812.0

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
public let keyWindow: UIWindow = {
    guard let window = UIApplication.shared.delegate?.window else {
        fatalError("Key window not available")
    }
    return window!
}()
