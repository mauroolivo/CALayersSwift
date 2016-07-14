//
//  DegreesToRadians.swift
//  CALayersSwift
//
//  Created by Mauro Olivo on 14/07/16.
//  Copyright © 2016 Mauro Olivo. All rights reserved.
//

import UIKit

let π = CGFloat(M_PI)

func DegreesToRadians (value:CGFloat) -> CGFloat {
    return value * π / 180.0
}

func RadiansToDegrees (value:CGFloat) -> CGFloat {
    return value * 180.0 / π
}