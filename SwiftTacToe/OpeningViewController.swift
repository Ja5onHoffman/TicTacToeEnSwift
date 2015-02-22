//
//  ViewController.swift
//  SwiftTacToe
//
//  Created by Jason Hoffman on 2/13/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class OpeningViewController: UIViewController {
    
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    
    var playerIsX: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let xImage = UIImage(named: "xImage")
        let oImage = UIImage(named: "oImage")
        
        if xImage != nil {
            xButton.setImage(xImage, forState: .Normal)
        }
        
        if oImage != nil {
            oButton.setImage(oImage, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "xButtonSelected" {
            let gvc = segue.destinationViewController as GameViewController
            gvc.playerIsX = true
        }
        
        if segue.identifier == "oButtonSelected" {
            let gvc = segue.destinationViewController as GameViewController
            gvc.playerIsX == false
        }
    }

    @IBAction func unwindToOpeningView(sender: UIButton) {
        
    }

}

