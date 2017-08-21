//
//  KKCommentCell.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

class KKCommentCell: UITableViewCell {

    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var comment:KKComment?{
    
        didSet{
            if let user = comment!.user {
                headerImage.kf.setImage(with:URL(string:user.avatar_url!)
                    , placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
                headerImage.layer.cornerRadius = headerImage.height * 0.5;
                headerImage.layer.masksToBounds = true
                headerImage.layer.shouldRasterize = true
                
                commentLabel.text = comment?.content
                nameLabel.text = user.nickname
            }
            
            
        }
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
