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
            weakSelf?.tableView.reloadData()
        }

        refreshControl?.addTarget(self, action: #selector(reloadHomeData), for: .valueChanged)
        
    }

    func setupTableView(){
    
        tableView.rowHeight = 140
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName:String(describing: KKHomeCell.self), bundle: nil), forCellReuseIdentifier: "KKHomeCell")
    }
    func reloadHomeData() {
    
       weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestHomeData(id: type) { (homeItems) in
            
            weakSelf?.itmes = homeItems
            weakSelf?.tableView.reloadData()
            weakSelf?.refreshControl?.endRefreshing()
        }
        
    }
    //MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itmes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath) as! KKHomeCell
        
        homeCell.homeItem = itmes[indexPath.row]
        
        homeCell.delegate = self as! KKHomeCellDelegate
        
        return homeCell
    }

    //KKHomeCellDelegate
    func homeCellDidClickedFavouriteButton(button:UIButton){
    
        print("代理方式实现了")
    }
    
    
}
