//
//  KKProductViewController.swift
//  Tang
//
//  Created by M_Li on 2017/8/15.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKProductViewController: KKBaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    weak var collectionView:UICollectionView?
    let cellIdentifier = "ProductCollectionCellID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //Setup
    private func setupCollectionView(){
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
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
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
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
    
    
}
