//
//  KKBaseViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class KKBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = KKGlobeColor()
        navigationController?.fd_prefersNavigationBarHidden = true
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        SVProgressHUD.setBackgroundColor(KKColor(r: 0, g: 0, b: 0, aplha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.white)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle{
    
        return .lightContent
    }

    
}
