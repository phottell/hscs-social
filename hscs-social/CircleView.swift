//
//  CircleView.swift
//  hscs-social
//
//  Created by Paul Hottell on 1/8/17.
//  Copyright © 2017 HSCS. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
         layer.cornerRadius = self.frame.width / 2
         clipsToBounds = true
    }
}
