//
//  KKDetailChoiceButton.swift
//  Tang
//
//  Created by M_Li on 2017/8/18.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

protocol DetailChoiceDelegate:NSObjectProtocol {
    
    func commentButtonClicked()
    
    func introduceButtonClicked()
}

class KKDetailChoiceButton: UIView {

    @IBOutlet weak var bottonLine: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    
    weak var delegate: DetailChoiceDelegate?
    
    //class方法
    class func detailButtonView() -> KKDetailChoiceButton{
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! KKDetailChoiceButton
    }
    
    @IBAction func commentAction(_ sender: Any) {
        UIView.animate(withDuration: kAnimationDuration) { 
            self.bottonLine.x = KScreenW * 0.5
        }
        delegate?.commentButtonClicked()
    }
    
    @IBAction func introduceAction(_ sender: Any) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.bottonLine.x = 0
        }
        delegate?.introduceButtonClicked()
    }
    
   
}
