//
//  KKDetailViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/17.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import SVProgressHUD
class KKDetailViewController: UIViewController,UIWebViewDelegate{

    var homeItem : KKHomeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let webView = UIWebView()
        webView.frame = view.bounds
        webView.delegate = self
        view.addSubview(webView)
        webView.scalesPageToFit = true
//        webView.dataDetectorTypes = .all
        let url = URL(string: homeItem!.content_url!)
        let request = URLRequest(url: url! as URL)
        webView.loadRequest(request)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.setStatus("加载中...")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        SVProgressHUD.dismiss()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
}
