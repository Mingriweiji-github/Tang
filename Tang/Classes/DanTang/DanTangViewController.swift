//
//  DanTangViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DanTangViewController: KKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    
    func setupNav(){
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(rightBtnClicked))
    }
    func rightBtnClicked(){        
        
    }

    
}
