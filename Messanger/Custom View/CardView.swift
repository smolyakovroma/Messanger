//
//  ChatsViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 31/07/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerradius :CGFloat = 10
    @IBInspectable var shadowOffSetWidth :CGFloat = 6
    @IBInspectable var shadowOffSetHeight :CGFloat = 5
    @IBInspectable var shadowColor :UIColor = UIColor.gray
    @IBInspectable var shadowOpacity :CGFloat = 0.1
    @IBInspectable var leftMaskedCorners :Bool = false
    @IBInspectable var rightMaskedCorners :Bool = false
    
    @IBInspectable var borderWidth :CGFloat = 0
    @IBInspectable var useBorderColor :Bool = false
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerradius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
        layer.borderWidth = borderWidth
        if useBorderColor {
        layer.borderColor = UIColor(red:27/255, green:63/255, blue:255/255, alpha: 1).cgColor
        }
        if leftMaskedCorners {
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        }
        if rightMaskedCorners {
             layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        }
    }
}
