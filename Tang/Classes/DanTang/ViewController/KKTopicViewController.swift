//
//  KKTopicViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/16.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKTopicViewController: UITableViewController {
    var type = Int()
    var itmes = [KKHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestHomeData(id: type) { (homeItmes) in
            weakSelf!.itmes = homeItmes
            
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
