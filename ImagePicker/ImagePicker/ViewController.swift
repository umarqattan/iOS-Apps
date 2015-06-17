//
//  ViewController.swift
//  ImagePicker
//
//  Created by Umar Qattan on 4/28/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//  TODO: The TOP textfield's keyboard shifts up when it shouldn't

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imageView:     UIImageView!
    @IBOutlet weak var cameraButton:  UIBarButtonItem!
    @IBOutlet weak var top:           UITextField!
    @IBOutlet weak var bottom:        UITextField!
    @IBOutlet weak var shareButton:   UIBarButtonItem!
    @IBOutlet weak var topToolBar:    UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.top.delegate        = self
        self.bottom.delegate     = self
        self.shareButton.enabled = false
       
        
        let memeTextAttributes = [
            NSStrokeColorAttributeName     : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName            : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName     : -4.0
            ]
        
        self.top.defaultTextAttributes    = memeTextAttributes
        self.bottom.defaultTextAttributes = memeTextAttributes
        
        
        /**
            I had so much trouble trying to figure out
            why my UITextfield objects were not displa-
            yed over the UIImageView. I simply placed
            them at the bottom of the UIView hierarchy
            in Main.storyboard. Below is a link to my
            source of inspiration:
            http://stackoverflow.com/questions/7402677/how-do-you-show-uilabel-over-a-uiimageview-objective-c
        **/
        
        self.top.text             = "TOP"
        self.bottom.text          = "BOTTOM"
        self.top.textAlignment    = .Center
        self.bottom.textAlignment = .Center
        
        
        
        
    }
    func generateMemedImage() -> UIImage
    {
        // Render view to an image
        self.topToolBar.hidden    = true
        self.bottomToolbar.hidden = true
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame,
            afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.topToolBar.hidden    = false
        self.bottomToolbar.hidden = false
        return memedImage
    }

    @IBAction func share(sender: UIBarButtonItem)
    {
        if self.shareButton.enabled == true
        {
            var meme = generateMemedImage()
            var activityViewController = UIActivityViewController(activityItems: [meme], applicationActivities: nil)
            self.presentViewController(activityViewController, animated: true, completion:{self.save();})
        }
    }
    func save()
    {
        var meme = Meme(top: self.top.text, bottom: self.bottom.text, originalImage:self.imageView.image!, memedImage:generateMemedImage())
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.append(meme)
    }
    
    
    
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        self.subscribeToKeyboardNotifications()
    }
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.unsubscribeFromKeyboardNotifications()
    }
    
    func subscribeToKeyboardNotifications()
    {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name:UIKeyboardWillShowNotification,
            object:nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name:UIKeyboardWillHideNotification,
            object:nil)
    }
    
    func keyboardWillShow(notification: NSNotification)
    {
        self.view.frame.origin.y -= getKeyBoardHeight(notification)
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        self.view.frame.origin.y += getKeyBoardHeight(notification)
    }
    
    
    
    func getKeyBoardHeight(notification: NSNotification) -> CGFloat
    {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
    
    @IBAction func pickAnImageFromAlbum(sender: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(sender: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            self.imageView.contentMode = UIViewContentMode.ScaleToFill
            self.imageView.image       = image
            self.imageView.userInteractionEnabled = true
            self.shareButton.enabled   = true
            
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        
        textField.text = ""
    }
    func textFieldDidEndEditing(textField: UITextField)
    {
        if(textField.text == "" && textField == self.top)
        {
            textField.text = "TOP"
        }
        if (textField.text == "" && textField == self.bottom)
        {
            textField.text = "BOTTOM"
        }
        //textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
}

