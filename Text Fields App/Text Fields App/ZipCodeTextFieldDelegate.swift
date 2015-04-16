//
//  ZipCodeTextFieldDelegate.swift
//  Text Fields App
//
//  Created by Umar Qattan on 4/16/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import Foundation
import UIKit


class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate
{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        var zipCode = textField.text as NSString
        zipCode = zipCode.stringByReplacingCharactersInRange(range, withString: string)
        return zipCode.length < 6
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
}