//
//  ViewController.swift
//  Roshambo
//
//  Created by Umar Qattan on 4/13/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    var initMatch:[String] = ["You","Opponent","Result"]
    var match:[String] = []
    var matchImage: [UIImage] = []
    
    
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
    
    @IBAction func showHistory(sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    
   
    
    
    

}

