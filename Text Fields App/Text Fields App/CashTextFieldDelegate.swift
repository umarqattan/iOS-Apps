//
//  CashTextFieldDelegate.swift
//  Text Fields App
//
//  Created by Umar Qattan on 4/16/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate
{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        var oldText = textField.text as NSString
        var newText = oldText.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        
        var digitText = ""
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        for c in newTextString.unicodeScalars
        {
            if digits.longCharacterIsMember(c.value)
            {
                digitText.append(c)
            }
            else
            {
                continue
            }
        }
        if let numberOfPennies = digitText.toInt()
        {
            var dollarStringFromInt = String(numberOfPennies/100)
            var value = numberOfPennies % 100
            var cents:String = ""
            if value < 10
            {
                cents = "0" + String(value)
            }
            cents = String(value)
            
            var centsStringFromInt = String(cents)
            newText = "$" + dollarStringFromInt + "." + cents
            
        }
        textField.text = newText
        return false
    }
    
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty
        {
            textField.text = "$0.00"
        }
        
    }
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}