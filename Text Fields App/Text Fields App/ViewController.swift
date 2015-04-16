//
//  ViewController.swift
//  Text Fields App
//
//  Created by Umar Qattan on 4/15/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var zipCodeTextField:  UITextField!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var lockedTextField:   UITextField!
    @IBOutlet weak var lockSwitch:           UISwitch!
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    
    var cash:String = "$0.00"
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        self.zipCodeTextField.delegate  = self.zipCodeTextFieldDelegate
        self.currencyTextField.delegate = self.cashTextFieldDelegate
        self.lockedTextField.delegate   = self
        self.lockSwitch.setOn(false, animated: false)
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        return self.lockSwitch.on
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
            return true
    }

    @IBAction func toggleSwitch(sender: UISwitch)
    {
        if !sender.on
        {
            self.lockedTextField.resignFirstResponder()
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
   
   

    

}

