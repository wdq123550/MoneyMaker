//
//  MMExtension.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import Foundation
import UIKit

//MARK: - Color
public extension UIColor {
    /// color to image
    /// - Returns: UIImage
    func asImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("Graphics context not created.")
        }
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

//MARK: - UIView
public extension UIView {
    
    //圆角设置集合
    struct LayerSet {
        public var cornerRadius: CGFloat?
        public var borderWidth: CGFloat?
        public var borderColor: UIColor?
    }
    
    /// 渐变方向
    enum GradientDirection {
        case topToBottom       // 从上到下
        case bottomToTop       // 从下到上
        case leftToRight       // 从左到右
        case rightToLeft       // 从右到左
    }

    /// 设置渐变背景色
    /// - Parameters:
    ///   - colors: 渐变的颜色数组
    ///   - direction: 渐变方向，默认为从上到下
    func setGradientBackground(colors: [UIColor], direction: GradientDirection) {
        
        //计算宽高
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        // 移除已有的渐变图层
        self.removeGradientLayer()
        
        // 创建渐变图层
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.frame = self.bounds
        
        // 设置渐变方向
        switch direction {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .bottomToTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        }
        
        // 将渐变图层插入到最底层
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /// 移除已有的渐变图层
    private func removeGradientLayer() {
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
    }
}

//MARK: - String
public extension String {
    /// 计算字符串的宽高
    /// - Parameters:
    ///   - font: 字符串使用的字体
    ///   - maxSize: 限制的最大尺寸（宽和高）
    /// - Returns: 文本绘制的实际尺寸
    func boundingSize(with font: UIFont, maxSize: CGSize) -> CGSize {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let rect = self.boundingRect(
            with: maxSize,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: attributes,
            context: nil
        )
        return rect.size
    }
}
