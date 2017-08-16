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
    let homeCellIdentifier = "homeCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
        weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestHomeData(id: type) { (homeItmes) in
            weakSelf!.itmes = homeItmes
            
            
        }
        

    }

    func setupTableView(){
    
        tableView.rowHeight = 140
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName:String(describing: KKHomeCell.self), bundle: nil), forCellReuseIdentifier: "KKHomeCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath) as! KKHomeCell
        
        return homeCell
    }
    
}
