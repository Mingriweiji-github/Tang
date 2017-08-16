//
//  KKTabBarController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = KKColor(r: 245.0, g: 90.0, b: 91.0, aplha:1.0)
        addChilds()
    }

    //重载函数
   private func addChildViewController(childController: UIViewController,title:String,imageName:String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        childController.title = title
        let navi = KKNavigationController(rootViewController: childController)
        addChildViewController(navi)
    }
    
    private func addChilds(){
        addChildViewController(childController: DanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController(childController: KKProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController(childController: KKCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController(childController: KKMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
//    private func addChildViewControllers() {
//        addChildViewController(childController: DanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
//        addChildViewController(childController: KKProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
//        addChildViewController(childController: KKCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
//        addChildViewController(childController: KKMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
//
//    }
    
}
