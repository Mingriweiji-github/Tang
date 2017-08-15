//
//  KKConst.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

//Size
let KScreenW = UIScreen.main.bounds.size.width
let KScreenH = UIScreen.main.bounds.size.height
let KItemW = 100
let KItemH = 150
let isPhone6 = KScreenH == 667 ? true : false
let isPhone6P = KScreenH == 736 ? true : false


//URL
let BASE_URL = "http://api.dantangapp.com/"
let ReturnCode200 = 200

//RGB
func KKColor(r:CGFloat,g:CGFloat,b:CGFloat,aplha:CGFloat)->UIColor{

    return UIColor(red: r, green: g, blue: b, alpha: aplha)
}

func KKGlobeColor() -> UIColor{

    return KKColor(r: 240, g: 240, b: 240, aplha: 1.0)
    
}

func KKRedColor() -> UIColor{

    return KKColor(r: 245, g: 80, b: 80, aplha: 1.0)
}

		
