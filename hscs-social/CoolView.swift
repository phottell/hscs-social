//
//  CoolView.swift
//  hscs-social
//
//  Created by Paul Hottell on 1/7/17.
//  Copyright © 2017 HSCS. All rights reserved.
//

import UIKit

class CoolView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
}
