//
//  KKProductCollectionCell.swift
//  Tang
//
//  Created by M_Li on 2017/8/17.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKProductCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var placeHolderBtn: UIButton!
    
    @IBOutlet weak var favouriteBtn: UIButton!
    
    var product:KKProductModel?{
        didSet{
            let source = product!.cover_image_url!

            imgView.kf.setImage(with: URL(string:source), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                self.placeHolderBtn.isHidden = true
            }
            titleLabel.text = product?.name
            priceLabel.text = "￥" + product!.price!
            favouriteBtn.setTitle(String(describing: product!.favorites_count!) + " ", for: .normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipRectCorner(direction:.topLeft, cornerRadius: 5)
    }
    @IBAction func favouriteAction(_ sender: UIButton) {
        
        
    }

}
