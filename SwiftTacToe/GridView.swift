//
//  GridView.swift
//  SwiftTacToe
//
//  Created by Jason Hoffman on 2/16/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class GridView: UIView {

    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath()
        path.lineWidth = 10;
        path.lineCapStyle = kCGLineCapRound;
        
        path.moveToPoint(CGPointMake(105, 0))
        path.addLineToPoint(CGPointMake(105, 320))
        
        path.moveToPoint(CGPointMake(215, 0))
        path.addLineToPoint(CGPointMake(215, 320))
        
        path.moveToPoint(CGPointMake(0, 105))
        path.addLineToPoint(CGPointMake(320, 105))
        
        path.moveToPoint(CGPointMake(0, 215))
        path.addLineToPoint(CGPointMake(320, 215))
        
        UIColor.blackColor().setStroke()
        
       path.stroke()
    }
}
