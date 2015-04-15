//
//  ViewController.swift
//  Roshambo
//
//  Created by Umar Qattan on 4/13/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBAction func rockButton(sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("RoshamboViewController") as! RoshamboViewController
        if let aPlayerMove = sender.titleForState(.Normal)
        {
            vc.playerMove = aPlayerMove
        }
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func paperButton(sender: UIButton)
    {
        performSegueWithIdentifier("playRoshambo", sender: sender)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playRoshambo"
        {
            let vc = segue.destinationViewController as! RoshamboViewController
            if let aPlayerMove = sender?.titleForState(.Normal)
            {
                vc.playerMove = aPlayerMove
            }
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    
   
    
    
    

}

