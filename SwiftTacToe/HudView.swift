//
//  HudView.swift
//  SwiftTacToe
//
//  Created by Jason Hoffman on 2/16/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class HudView: UIView, UIGestureRecognizerDelegate {
    
    var labelRect: CGRect?
    var messageLabel: UILabel?
    // let tapRec = UITapGestureRecognizer()
    
    class func hudInView(view: UIView, message: String, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.opaque = false
        hudView.tag = 101
        
        let labelRect: CGRect = CGRectMake(10, 75, 180, 85)
        let messageLabel: UILabel = UILabel(frame: labelRect)
        
        hudView.addSubview(messageLabel)
        messageLabel.center = hudView.center
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            messageLabel.text = message
        })
        
        view.addSubview(hudView)
        
        return hudView
    }

    override func drawRect(rect: CGRect) {
        let boxWidth: CGFloat = 192.0
        let boxHeight: CGFloat = 96.0
        
        let boxRect: CGRect = CGRectMake(
            round(self.bounds.size.width - boxWidth) / 2.0 as CGFloat,
            round(self.bounds.size.width - boxHeight) / 2.0 as CGFloat,
            boxWidth, boxHeight)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, byRoundingCorners: .AllCorners, cornerRadii: CGSize(width: 10.0, height: 10.0))
        let color = UIColor(white: 0.3, alpha: 0.8)
        color.setFill()
        roundedRect.fill()
    }
}
