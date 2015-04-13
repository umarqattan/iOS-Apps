//
//  ViewController.swift
//  Click Counter
//
//  Created by Umar Qattan on 4/13/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var label1: UILabel!
    var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var label1   = UILabel()
        var label2   = UILabel()
        label1.frame = CGRectMake(150, 150, 60, 60)
        label1.text  = "0"
        label2.frame = CGRectMake(220, 150, 60, 60)
        label2.text  = "0"
        
        var button1   = UIButton()
        var button2   = UIButton()
        button1.frame = CGRectMake(100, 250, 60, 60)
        button2.frame = CGRectMake(160, 250, 60, 60)
        button1.setTitle("UP",   forState: .Normal)
        button2.setTitle("DOWN", forState: .Normal)
        button1.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button2.setTitleColor(UIColor.redColor(),  forState: .Normal)
        
        self.view.addSubview(label1)
        self.view.addSubview(button1)
        self.view.addSubview(label2)
        self.view.addSubview(button2)
        
        button1.addTarget(self, action: "incrementCount", forControlEvents: UIControlEvents.TouchUpInside)
        button2.addTarget(self, action: "decrementCount", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        self.label1 = label1
        self.label2 = label2
    }
    
    
    func incrementCount()
    {
        self.count++
        self.label1.text = "\(self.count)"
        self.label2.text = "\(self.count)"
        self.view.backgroundColor = getRandomColor()
    }
    func decrementCount()
    {
        self.count--
        self.label1.text = "\(self.count)"
        self.label2.text = "\(self.count)"
        self.view.backgroundColor = getRandomColor()
    }
    func getRandomColor() -> UIColor{
        
        var randomRed:  CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }


}

