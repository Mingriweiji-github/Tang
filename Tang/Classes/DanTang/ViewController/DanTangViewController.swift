//
//  DanTangViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class DanTangViewController: KKBaseViewController {

    var channels = [KKChannel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("进来了")
        //首页顶部
        KKNetworkTool.sharedInstance.requestHomeTopData { (kk_channels) in
            
            print(kk_channels)
            
            for channels in kk_channels{
            
                
            }
            
            
        }
        
    }

    
    func setupNav(){
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(rightBtnClicked))
    }
    func rightBtnClicked(){        
        
    }

    
}
