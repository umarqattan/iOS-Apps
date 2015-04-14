//
//  ViewController.swift
//  Click Counter
//
//  Created by Umar Qattan on 4/13/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var count = 0
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    
    
    }
    
    
    @IBAction func incrementCount()
    {
        self.count++
        self.label.text = "\(self.count)"
        self.view.backgroundColor = getRandomColor()
    }
    /**
    @IBAction func decrementCount()
    {
        self.count--
        self.label.text = "\(self.count)"
        self.view.backgroundColor = getRandomColor()
    }
    **/
    func getRandomColor() -> UIColor{
        
        var randomRed:  CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }


}

