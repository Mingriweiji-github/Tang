//
//  KKProductViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKProductViewController: KKBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    let cellIdentifier = "ProductCollectionCellID"

    weak var collectionView: UICollectionView?
    
    var products = [KKProductModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        loadData()
    }
    //Data
    private func loadData(){
        weak var weakSelf = self
        KKNetworkTool.sharedInstance.requestProductData { (products) in
//            print("products:\(products)")
            weakSelf?.products = products
            weakSelf?.collectionView?.reloadData()
        }
    }
    //Setup
    private func setupCollectionView(){
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = view.backgroundColor
        view.addSubview(collectionView)
        self.collectionView = collectionView
        //register
        let nib = UINib(nibName: String(describing: KKProductCollectionCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    // data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! KKProductCollectionCell
        
        cell.product = products[indexPath.row]
        
        return cell
    }
    //MARK:Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  width:CGFloat = (KScreenW - 20) / 2
        let height:CGFloat = 245
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  vc = KKProductDetainController()
        vc.product = products[indexPath.row]
        vc.title = "商品详情"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
