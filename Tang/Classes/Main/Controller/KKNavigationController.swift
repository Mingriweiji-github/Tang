//
//  KKNavigationController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import SVProgressHUD

class KKNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    internal override class func initialize(){
    
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = KKRedColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.systemFont(ofSize: 20)]
    }
    
    /// 拦截所有push
    /// 统一控制器导航栏返回按妞
    /// - Parameters:
    ///   - viewController: <#viewController description#>
    ///   - animated: <#animated description#>
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {//不是根控制器
            //push后隐藏tabBar
            viewController.hidesBottomBarWhenPushed = true
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackAction))
        }
    }
    
    func navigationBackAction(){
    
        if SVProgressHUD.isVisible(){
            SVProgressHUD.dismiss()
        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        popViewController(animated: true)
    }
    
}
