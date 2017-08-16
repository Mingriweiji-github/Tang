//
//  KKChannel.swift
//  Tang
//
//  Created by M_Li on 2017/8/16.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKChannel: NSObject {

    var name :String?
    var id :Int?
    var editable:Bool?
    
    init(dict:[String:AnyObject]) {
        name = dict["name"] as? String
        id = dict["id"] as? Int
        editable = dict["editable"] as? Bool
    }
    
}
