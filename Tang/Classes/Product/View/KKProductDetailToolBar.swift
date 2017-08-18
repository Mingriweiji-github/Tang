//
//  KKProductDetailToolBar.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

protocol DetailToolBarDelegate:NSObjectProtocol {
    func tooBarMallButtonClick()
}

class KKProductDetailToolBar: UIView {

    @IBOutlet weak var buyMaollBtn: UIButton!
    weak var delegate:DetailToolBarDelegate?
    
    @IBAction func goMallClicke(_ sender: UIButton) {
        delegate?.tooBarMallButtonClick()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        buyMaollBtn.layer.masksToBounds = true
        buyMaollBtn.layer.cornerRadius = 5
    }
}
