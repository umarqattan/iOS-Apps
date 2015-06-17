//
//  MYOAViewController.swift
//  MYOA
//
//  Created by Umar Qattan on 4/27/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import Foundation
import UIKit

class MYOAViewController: UIViewController
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .Plain, target: self, action: "startOver")
        
    }
    
    func startOver()
    {
        if let navigationViewController = self.navigationController
        {
            navigationViewController.popToRootViewControllerAnimated(true)
        }
        
    }
    
    deinit
    {
        println("MYOA ViewController deallocatd")
    }
}