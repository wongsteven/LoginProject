//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by steven wong on 7/1/15.
//  Copyright (c) 2015 steven.w. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated ()
}

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //Add a property
    var delegate:CreateAccountViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        if choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text != nil {
            
            //  NSUserDefaults is used to store small bits of information
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUserNameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
            
            //  Saves the NSUserDefault
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            //Call the function
            delegate?.accountCreated()
        }
    }
}
