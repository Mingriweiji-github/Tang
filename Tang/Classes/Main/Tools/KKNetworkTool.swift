//
//  KKNetworkTool.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SVProgressHUD

class KKNetworkTool: NSObject {
    
    static let sharedInstance = KKNetworkTool()

    /// Home data
    func requestHomeData(id:Int,finished:@escaping(_ homeItems:[KKHomeItem])->()){
        
        let url = BASE_URL + "v1/channels/\(id)/items"
        let param = ["gender":1,"generation":1,"limit":20,"offset":0]
        
        Alamofire.request(url, method: .get, parameters: param).responseJSON { (response) in
            
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "请求首页失败")
                return
            }
            print("首页数据\(response)")
            if let value = response.result.value{
                let dict = JSON(value)
                let code = dict["code"].intValue
                guard code == ReturnCode200 else{
                    SVProgressHUD.showError(withStatus: dict["message"].stringValue)
                    return
                }
                let data = dict["data"].dictionary
                if let items = data!["items"]?.arrayObject{
                    var homeItems = [KKHomeItem]()
                    for item in items{
                        let homeItem = KKHomeItem(dict: item as! [String:AnyObject])
                        homeItems.append(homeItem)
                    }
                    finished(homeItems)
                }
            
            }
       }
    
   }
    
    //首页顶部topic
    func requestHomeTopData(finished:@escaping (_ channels:[KKChannel]) -> ()) {

        let url = BASE_URL + KKTopData
        let params = ["gender":1,"generation":1]
        
        Alamofire
        .request(url, method: .get, parameters: params)
        .responseJSON { (responsJSON) in
            guard responsJSON.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "获取首页顶部数据失败")
                return
            }
            if let value = responsJSON.result.value{
                let dict = JSON(value)
                let code = dict["code"].intValue
                guard code == ReturnCode200 else{
                    SVProgressHUD.showError(withStatus: dict["message"].stringValue)
                    return
                }
                let data = dict["data"].dictionary
                if let channels = data!["channels"]?.arrayObject{
                    var kk_channels = [KKChannel]()
                    for channel in channels{
                        let kk_Channel = KKChannel(dict: channel as! [String:AnyObject])
                        kk_channels.append(kk_Channel)
                    }
                    finished(kk_channels)
                }
                
            }
        }
    }

    //单品
    func requestProductData(finished:@escaping(_ products:[KKProductModel]) -> ()){
        
        SVProgressHUD.show(withStatus: "加载中...")
        let url = BASE_URL + KKProductData
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        
        Alamofire
        .request(url, parameters: params)
        .responseJSON { (response) in
            
            guard response.result.isSuccess else{
            SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
                        
        }
        
    }
    
    
    
    
    
}


