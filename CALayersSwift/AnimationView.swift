//
//  AnimationView.swift
//  CALayersSwift
//
//  Created by Mauro Olivo on 14/07/16.
//  Copyright © 2016 Mauro Olivo. All rights reserved.
//

import UIKit

@IBDesignable
class AnimationView: UIView {

    var range: CGFloat = 10
    var curValue: CGFloat = 0 {
        didSet {
            //animate()
        }
    }
    
    let bgLayer = CAShapeLayer()
    @IBInspectable var bgColor: UIColor = UIColor.grayColor() {
        didSet {
            configure()
        }
    }

    let fgLayer = CAShapeLayer()
    @IBInspectable var fgColor: UIColor = UIColor.blackColor() {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    func setup() {
        bgLayer.lineWidth = 25.0
        bgLayer.fillColor = nil
        bgLayer.strokeEnd = 1
        layer.addSublayer(bgLayer)
        
        fgLayer.lineWidth = 25.0
        fgLayer.fillColor = nil
        fgLayer.strokeEnd = 0.75
        layer.addSublayer(fgLayer)
        
        fgLayer.strokeEnd = 0
        curValue = 9.0
        //self.backgroundColor = UIColor.lightGrayColor()

    }
    
    func configure() {
        bgLayer.strokeColor = bgColor.CGColor
        fgLayer.strokeColor = fgColor.CGColor
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShapeLayer(bgLayer)
        setupShapeLayer(fgLayer)
    }
    
    private func setupShapeLayer(shapeLayer:CAShapeLayer) {
        shapeLayer.frame = self.bounds
        let startAngle   = DegreesToRadians(135.0)
        let endAngle     = DegreesToRadians(45.0)
        let radius       = CGRectGetHeight(self.bounds) * 0.25
        let path = UIBezierPath(arcCenter: CGPoint(x:CGRectGetMidX(bounds), y:CGRectGetMidY(bounds)), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        shapeLayer.path = path.CGPath
    }

    internal func animate() {
        
        print("animate")
        let fromValue = fgLayer.strokeEnd
        let toValue = curValue / range
        let percentChange = abs(fromValue - toValue)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        
        animation.duration = CFTimeInterval(percentChange * 5) // 3
        fgLayer.removeAnimationForKey("stroke")
        fgLayer.addAnimation(animation, forKey: "stroke")

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        fgLayer.strokeEnd = toValue
        CATransaction.commit()
        
    }
}
