//
//  KKProductDetailTopView.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import SnapKit

let detailCollectionCell = "KKDetailCollectionViewCell"

class KKProductDetailTopView: UIView ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var imageUrls = [String]()
    
    var product : KKProductModel?{
        didSet{
            //Cannot assign value of type 'String?' to type '[String]'
//            imageUrls = product?.cover_image_url!
            imageUrls = product!.image_urls!
            self.collection.reloadData()
            titleLabel.text = product?.name
            priceLabel.text = product?.price
            descripLabel.text = "      " + product!.describe!
            
            guard imageUrls.count > 1 else {
                pageControl.isHidden = true
                return
            }
            pageControl.isHidden = false
            pageControl.numberOfPages = imageUrls.count

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collection)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(pageControl)
        addSubview(descripLabel)
        
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(collection.snp.bottom).offset(-30)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-5)
            make.top.equalTo(collection.snp.bottom).offset(10)
            make.height.equalTo(25)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        descripLabel.snp.makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp.left)
            make.right.equalTo(priceLabel.snp.right)
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCollectionCell, for: indexPath) as! KKDetailCollectionViewCell
        cell.bgView.kf.setImage(with:URL(string: imageUrls[indexPath.row]),
                                placeholder: nil, options: nil,
                                progressBlock: nil) { (image, error, cacheType, url) in
                                cell.placeHolerBtn.isHidden = true
        }
        return cell
        
    }
    //lazy
    private lazy var collection: UICollectionView = {
    
        let collectionView = UICollectionView(frame:CGRect(x: 0, y: 0, width: KScreenW, height: 375) , collectionViewLayout: KKDetailLayout())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: String(describing: KKDetailCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier:detailCollectionCell)
        collectionView.backgroundColor = UIColor.lightGray
        
        return collectionView
    }()
    private lazy var pageControl:UIPageControl = {
        let pageCtrl = UIPageControl()
        pageCtrl.currentPageIndicatorTintColor = UIColor.red
        pageCtrl.pageIndicatorTintColor = UIColor.lightGray
        return pageCtrl
    }()
    
    private lazy var titleLabel:UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let price = UILabel()
        price.numberOfLines = 0
        price.textColor = KKRedColor()
        price.font = UIFont.systemFont(ofSize: 16)
        return price
    }()
    
    lazy var descripLabel: UILabel = {
        let descripLabel = UILabel()
        descripLabel.textColor = UIColor.darkGray
        descripLabel.font = UIFont.systemFont(ofSize: 14)
        descripLabel.numberOfLines = 0
        return descripLabel
    }()
    
    //Layout
    
    private class KKDetailLayout:UICollectionViewFlowLayout{
        fileprivate override func prepare() {
            
            itemSize = CGSize(width: KScreenW, height: 375)
            minimumLineSpacing = 0
            minimumInteritemSpacing = 0
            scrollDirection = .horizontal
            
            collectionView?.showsVerticalScrollIndicator = false
            collectionView?.showsHorizontalScrollIndicator = false
            collectionView?.bounces = true
            collectionView?.isPagingEnabled = true
        }
    }
    //ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.x
        
        let index = offset / KScreenW
        
        pageControl.currentPage = Int(index)
    }
}
