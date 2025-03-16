//
//  MMNavigationVC.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//  本类只提供基本的全屏返回手势，更改navigation title的颜色/字体/导航栏样式等，请子类化此类进行更改

import UIKit

class MMFullScreenBackNavigationVC: UINavigationController, UIGestureRecognizerDelegate {
    
    private let backImage: UIImage
    
    //子类必须重写此方法
    required init(rootViewController: UIViewController, backImage: UIImage) {
        self.backImage = backImage
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGes = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        panGes.delegate = self
        self.interactivePopGestureRecognizer?.view?.addGestureRecognizer(panGes)
        self.interactivePopGestureRecognizer?.isEnabled = false
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        if self.children.count > 1 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: self.backImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(self.back))
        }
    }
    
    @objc private func back() {
        self.popViewController(animated: true)
    }
    
    //MARK: - UIGestureRecognizerDelegate
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.children.count == 1 {//只有一个子控制器，不返回
            return false
        }
        if self.value(forKey: "_isTransitioning") as! Bool {//控制器正在返回中，不返回
            return false
        }
        if (gestureRecognizer as! UIPanGestureRecognizer).translation(in: gestureRecognizer.view).x <= 0 {//不是右滑返回
            return false
        }
        
        return true
    }
    
    
}

