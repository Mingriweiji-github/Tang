//
//  KKHomeCell.swift
//  Tang
//
//  Created by M_Li on 2017/8/16.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit
import Kingfisher

protocol KKHomeCellDelegate: NSObjectProtocol {
    
    func homeCellDidClickedFavouriteButton(button:UIButton)
}

class KKHomeCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var favouriteBtn: UIButton!
    
    @IBOutlet weak var placeHolderButton: UIButton!
    
    weak var delegate : KKHomeCellDelegate?
    
    
    var homeItem: KKHomeItem? {
    
        didSet{
        
            let url  = homeItem?.cover_image_url
            imgView.kf.setImage(with: URL(string:url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeHolderButton.isHidden = true
            }
            titleLabel.text = homeItem?.title
            favouriteBtn.setTitle(" " + String(describing: homeItem!.likes_count!), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favouriteBtn.layer.cornerRadius = favouriteBtn.height * 0.5
        favouriteBtn.layer.masksToBounds = true
        favouriteBtn.layer.shouldRasterize = true
        favouriteBtn.layer.rasterizationScale = UIScreen.main.scale
        
        imgView.layer.cornerRadius = 5.0
        imgView.layer.masksToBounds = true
        imgView.layer.shouldRasterize = true
        imgView.layer.rasterizationScale = UIScreen.main.scale
        
    }

    @IBAction func favourAction(_ sender: UIButton) {
        delegate?.homeCellDidClickedFavouriteButton(button:sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
