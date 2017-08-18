//
//  KKProductDetailBottomView.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

let CellIDentifer = "KKCommentCell"

class KKProductDetailBottomView: UIView ,DetailChoiceDelegate,UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate{

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        addSubview(choiceButtonView)
        addSubview(commentTableView)
        addSubview(webView)
        
        choiceButtonView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.size.equalTo(CGSize(width: KScreenW, height: 44))
        }
        
        commentTableView.snp.makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
        
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    //Lazy
    lazy var webView: UIWebView = {
        let webView = UIWebView()
        webView.delegate = self
        webView.dataDetectorTypes = .all
        
        webView.scalesPageToFit = true
        return webView
    }()
    
    lazy var commentTableView: UITableView = {
        let commentTableView = UITableView()
        commentTableView.delegate = self
        commentTableView.dataSource = self
        commentTableView.isHidden = true
        let nib = UINib(nibName: String(describing: KKCommentCell.self), bundle: nil)
        commentTableView.register(nib, forCellReuseIdentifier: CellIDentifer)
        
        return commentTableView
    }()

    
    lazy var choiceButtonView: KKDetailChoiceButton = {
        //类方法的调用 .
        let choiceButtonView = KKDetailChoiceButton.detailButtonView()
        choiceButtonView.delegate = self
        return choiceButtonView
    }()
    
    //webView delegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    //tableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 00
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  commentCell = tableView.dequeueReusableCell(withIdentifier: CellIDentifer, for: indexPath)
        
        return commentCell
    }
    
    //DetailChoiceDelegate
    func commentButtonClicked(){
    
        
    }
    func introduceButtonClicked(){
    
        
    }
}
