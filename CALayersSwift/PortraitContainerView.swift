//
//  PortraitContainerView.swift
//  CALayersSwift
//
//  Created by Mauro Olivo on 13/07/16.
//  Copyright © 2016 Mauro Olivo. All rights reserved.
//

import UIKit

@IBDesignable
class PortraitContainerView: UIView {

    let layerGradient = CAGradientLayer()
    let startColor = UIColor(red: 45.0/255.0, green: 200.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    let endColor = UIColor(red: 45.0/255.0, green: 150.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {

        layer.insertSublayer(layerGradient, atIndex: 0)
        layerGradient.colors = [startColor.CGColor,endColor.CGColor]
        layerGradient.startPoint = CGPoint(x: 0.5, y: 0)
        layerGradient.endPoint = CGPoint(x: 0.5, y: 1)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layerGradient.frame = CGRect(x: 0, y: 0, width: CGRectGetWidth(self.bounds), height: CGRectGetHeight(self.bounds)/2)
    }
    
}
