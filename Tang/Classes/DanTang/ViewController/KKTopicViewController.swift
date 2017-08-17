//
//  KKTopicViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/16.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKTopicViewController: UITableViewController,KKHomeCellDelegate{
    var type = Int()
    var itmes = [KKHomeItem]()
    let homeCellIdentifier = "KKHomeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = KKRedColor()
        setupTableView()
        refreshControl?.addTarget(self, action: #selector(reloadHomeInfo), for: .valueChanged)

        //刷新
        weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestHomeData(id: type) { (homeItmes) in
            weakSelf!.itmes = homeItmes
            weakSelf!.tableView.reloadData()
        }
    }

    func reloadHomeInfo(){
    
        weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestHomeData(id: type) { (homeItem) in
            weakSelf?.itmes = homeItem
            weakSelf?.tableView.reloadData()
            weakSelf?.refreshControl?.endRefreshing()
        }
    }
    
    func setupTableView(){
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, (tabBarController?.tabBar.height)!, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.register(UINib(nibName:String(describing: KKHomeCell.self), bundle: nil), forCellReuseIdentifier: homeCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itmes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath) as! KKHomeCell
        
        homeCell.selectionStyle = .none
        homeCell.homeItem = itmes[indexPath.row]
        homeCell.delegate = self
        
        return homeCell
    }
    //tableDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = KKDetailViewController()
        detail.homeItem = itmes[indexPath.row]
        detail.title = "详情"
        navigationController?.pushViewController(detail, animated: true)
        
    }
    
    //homeCell Delegate
    func homeCellDidClickedFavouriteButton(button:UIButton){
    
        print("HomeCellDelegate implement")
    }
}
