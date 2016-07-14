//
//  ViewController.swift
//  CALayersSwift
//
//  Created by Mauro Olivo on 13/07/16.
//  Copyright © 2016 Mauro Olivo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someButton: UIButton!
    @IBOutlet weak var portrait: UIImageView!
    @IBOutlet weak var animationView: AnimationView!
    
    @IBAction func animateButton(sender: AnyObject) {
        animationView.fgLayer.strokeEnd = 0.0
        animationView.animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someButton.layer.cornerRadius = CGRectGetHeight(someButton.bounds)/2.0
        
        portrait.layer.cornerRadius = CGRectGetHeight(portrait.bounds)/2.0
        portrait.layer.masksToBounds = true
        
        portrait.layer.borderWidth = 5.0
        portrait.layer.borderColor = UIColor.whiteColor().CGColor
        
        someButton.layer.shadowRadius = 3.0
        someButton.layer.shadowOpacity = 0.5
        someButton.layer.shadowOffset = CGSize.zero
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

