//
//  DanTangViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class DanTangViewController: KKBaseViewController ,UIScrollViewDelegate{

    var channels = [KKChannel]()
    
    weak var titleView = UIView()
    
    weak var indicatorView = UIView()

    weak var selectedBtn = UIButton()
    
    weak var contentView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("进来了")
        setupNav()

        weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestHomeTopData { (kk_channels) in
            
            for channels in kk_channels{//返回title数据添加子类控制器
                let topVC = KKTopicViewController()
                topVC.title = channels.name
                topVC.type = channels.id!
                weakSelf?.addChildViewController(topVC)
            }
            
            weakSelf?.setupTitlesView()
            weakSelf?.setupContentScrollView()
        }
    }

    /// 初始化子控制器
    func setupChildViewControllers() {
        for channel in channels {
            let vc = KKTopicViewController()
            vc.title = channel.name
            addChildViewController(vc)
        }
    }

    
    //Setup
    func setupTitlesView() -> () {
        
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: 64, width: KScreenW, height: 35)
        view.addSubview(bgView)
        
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: KScreenW - 35, height: 35)
        titleView.backgroundColor = KKGlobeColor()
        bgView.addSubview(titleView)
        self.titleView = titleView
        
        let indicatorView = UIView()
        indicatorView.height = 2
        indicatorView.y = 35 - 2
        indicatorView.backgroundColor = KKRedColor()
        //
        titleView.addSubview(indicatorView)
        self.indicatorView = indicatorView
        indicatorView.tag = -1

        //选择按钮
        let selectButton = UIButton()
        selectButton.frame = CGRect(x: KScreenW - 35, y: 0, width: 35, height: 35)
        selectButton.backgroundColor = KKGlobeColor()
        selectButton.setImage(UIImage(named:"arrow_index_down_8x4_"), for:.normal)
        selectButton.addTarget(self, action: #selector(selectButtonCliced), for: .touchUpInside)
        bgView.addSubview(selectButton)
        
        //子标签
        let count = childViewControllers.count
        let width = titleView.width / CGFloat(count)
        let height = titleView.height
        for index  in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x = width * CGFloat(index)
            button.tag = index
            
            let vc = childViewControllers[index]
            button.setTitle(vc.title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(KKRedColor(), for: .disabled)
            button.addTarget(self, action: #selector(titleClicked), for: .touchUpInside)
            titleView.addSubview(button)
            //默认第一个选中
            if index == 0 {
                button.isEnabled = false
                self.selectedBtn = button
                button.titleLabel?.sizeToFit()//label会根据文字来计算内容
                indicatorView.width = (button.titleLabel!.width)
                indicatorView.centerX = button.centerX
            }
        }
    }
    
    func setupNav(){
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(rightBtnClicked))
    }
    func setupContentScrollView(){
        automaticallyAdjustsScrollViewInsets = false
        
        let content = UIScrollView()
        content.frame = view.bounds
        content.delegate = self
        content.contentSize = CGSize(width: content.width * CGFloat(childViewControllers.count), height: 0)
        content.isPagingEnabled = true
        
        //很关键的一句
        view.insertSubview(content, at: 0)
        self.contentView = content
        //第一个控制器view
        scrollViewDidEndScrollingAnimation(content)
    }
    //Action
    func titleClicked(button:UIButton){//标签按钮
    
        selectedBtn?.isEnabled = true
        button.isEnabled = false
        selectedBtn = button
        //标签动画
        UIView.animate(withDuration: kAnimationDuration) { 
//            self.indicatorView?.width = (self.selectedBtn?.titleLabel?.width)!
//            self.indicatorView?.centerX = (self.selectedBtn?.centerX)!
            self.indicatorView!.width = self.selectedBtn!.titleLabel!.width
            self.indicatorView!.centerX = self.selectedBtn!.centerX
        }
        
        //滚动 切换自控制器
        var offset = contentView!.contentOffset
        offset.x = (contentView!.width) * CGFloat(button.tag)
        contentView!.setContentOffset(offset, animated: true)
    }
    func rightBtnClicked(){        
        
    }
    func selectButtonCliced(button:UIButton){
    
        UIView.animate(withDuration: kAnimationDuration) {
            
            button.imageView?.transform = (button.imageView?.transform.rotated(by: .pi))!
            
        }
    }

    //MARK:scrollview Delegate
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        
//        let index = Int((contentView?.contentOffset.x)! / scrollView.width)
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        scrollViewDidEndScrollingAnimation(scrollView)
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let subView = titleView!.subviews[index]
        
        if subView is UIButton{
            let btn = subView as! UIButton
            titleClicked(button: btn)
        }
    }
}
