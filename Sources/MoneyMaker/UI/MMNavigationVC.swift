//
//  MMNavigationVC.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//  本类只提供基本的全屏返回手势，更改navigation title的颜色/字体/导航栏样式等，请子类化此类进行更改

import UIKit

open class MMFullScreenBackNavigationVC: UINavigationController, UIGestureRecognizerDelegate {
    
    
    //MARK: - init
    //子类必须重写此方法
    public required init(rootViewController: UIViewController, backImage: UIImage?) {
        self.backImage = backImage
        super.init(rootViewController: rootViewController)
    }
    
    //MARK: - open
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGes = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        panGes.delegate = self
        self.interactivePopGestureRecognizer?.view?.addGestureRecognizer(panGes)
        self.interactivePopGestureRecognizer?.isEnabled = false
        
    }

    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        if let backImage = self.backImage, self.children.count > 1{
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.back))
        }
    }
    
    //MARK: - UIGestureRecognizerDelegate
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.children.count == 1 { return false }//只有一个子控制器，不返回
        if self.value(forKey: "_isTransitioning") as! Bool { return false }//控制器正在返回中，不返回
        if (gestureRecognizer as! UIPanGestureRecognizer).translation(in: gestureRecognizer.view).x <= 0 { return false }//不是右滑返回
        return true
    }
    
    //MARK: - public
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: - private
    private let backImage: UIImage?
    @objc private func back() { self.popViewController(animated: true) }
    
}

