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

    func loadHomeData(id:Int,isFineshed:@escaping(_ homeItem:[KKHomeItem])->()) -> () {
        
        let url = BASE_URL + "v1/channels/\(id)/items"
        let param = ["gender":1,"generation":1,"limit":20,"offset":0]
        
        Alamofire.request(url, method: .get, parameters: param).responseJSON { (response) in
            
            guard response.result.isSuccess else{
                SVProgressHUD.showError(withStatus: "请求首页失败")
                return
            }
        
            if let value = response.result.value{
                let json = JSON(value)
                let responseCode = json["code"].intValue
                let message = json["message"].stringValue
                guard responseCode ==  ReturnCode200 else{
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                
                let data = json["data"].dictionary
                //字典转模型
                if let items = data?["items"]?.arrayValue{
                var homeItems = [KKHomeItem]()
                    for i in items{
//                    let homeItem = KKHomeItem()
                        
                    }
                    
                }
            
            }
        
       }
    
   }

}
