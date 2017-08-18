//
//  KKProductDetainController.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKProductDetainController: KKBaseViewController,DetailToolBarDelegate{

    var product: KKProductModel?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(sharedAction))
        
        view.addSubview(scrollView)
        view.addSubview(toolBar)
        scrollView.product = product
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolBar.snp.top)
        }
        
        toolBar.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(45)
        }
        
        scrollView.contentSize = CGSize(width: KScreenW, height: KScreenH - 64 + 45 + 520 + 10)
    }
    //Lazy
    private lazy var scrollView : KKProductDetailScrollView = {
    
        let scrollView = KKProductDetailScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
   
   private lazy var toolBar: KKProductDetailToolBar = {
    
        //mark: 'init' has been renamed to 'init(describing:)'
        let toolBar = Bundle.main.loadNibNamed(String(describing:KKProductDetailToolBar.self), owner: nil, options: nil)?.last as! KKProductDetailToolBar
        toolBar.delegate = self
        return toolBar
    }()
    
    //action
    func sharedAction() {
    
    }
    //点击底部天猫购买
    func tooBarMallButtonClick() {
        
    }

}
