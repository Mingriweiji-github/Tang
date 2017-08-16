//
//  UIView+Extension.swift
//  Tang
//
//  Created by M_Li on 2017/8/16.
//  Copyright © 2017年 M_Li. All rights reserved.
//

import UIKit

extension UIView{

    //UIView剪切圆角
    func clipRectCorner(direction:UIRectCorner,cornerRadius:CGFloat) -> () {
        
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let shapLayer = CAShapeLayer()
        shapLayer.frame = bounds
        shapLayer.path = path.cgPath
        layer.addSublayer(shapLayer)
        layer.mask = shapLayer
        
    }
    ///x
    var x:CGFloat{
    
        get{
            return frame.origin.x
        }
        set(newVlaue){
            var tempFrame:CGRect = frame
            
            tempFrame.origin.x = newVlaue
            frame = tempFrame
        }
    }
    ///y
    var y : CGFloat{
    
        get{
            return frame.origin.y
        }
        set(newValue){
        
            var temp:CGRect = frame
            temp.origin.y = newValue
            frame = temp
        }
    }
    
    //width
    var width:CGFloat{
        get{
            return frame.width
        }
        
        set(newWidth){
            var temp :CGRect = frame
            temp.size.width = newWidth
            frame = temp
        }
    }
    //height
    var height:CGFloat {
        get{
            return frame.height
        }
        set(newHeight){
            var  temp:CGRect = frame
            temp.size.height = newHeight
            frame = temp
        }
    }
    

    //size
    var size:CGSize{
        get{
            return frame.size
        }
        set(newSize){
            var tempp:CGRect = frame
            tempp.size = newSize
            frame = tempp
        }
    }
    
    //CentX
    var centerX:CGFloat {
    
        get{
            return center.x
        }
        set(newCenterX){
        
            var  temp:CGPoint = center
            temp.x = newCenterX
            center = temp
        }
    }
    
    //centY
    var centerY:CGFloat {
    
        get {
            return center.y
        }
        set(newCentY){
        
            var temp:CGPoint = center
            
            temp.y = newCentY
            
            center = temp
            
        }
    }
    
    
    



}
