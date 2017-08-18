//
//  KKProductDetailScrollView.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKProductDetailScrollView: UIScrollView {

    var product:KKProductModel?{
    
        didSet{
        
            topScrollView.product = product
            topScrollView.product = product
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(topScrollView)
        addSubview(bottomScrollView)
        
        topScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSize(width: KScreenW, height: 520))
        }
        bottomScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(topScrollView.snp.bottom)
            make.left.equalTo(self)
            make.size.equalTo(CGSize(width: KScreenW, height: KScreenH - 64 - 50))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var topScrollView: KKProductDetailTopView = {
        let topScrollView = KKProductDetailTopView()
        topScrollView.backgroundColor = UIColor.white
        return topScrollView
    }()
    
    lazy var bottomScrollView : KKProductDetailBottomView = {
        let bottomScrollView = KKProductDetailBottomView()
        return bottomScrollView
    }()
   
    
}
