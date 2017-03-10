//
//  RegisterViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/7/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onRegister(_ sender: UIButton) {
        
        //Validation
        if !(username.text?.isEmpty)! && !(password.text?.isEmpty)! && !(rePassword.text?.isEmpty)! {
            
            if password.text != rePassword.text {
                //alert passwords do not match
                Alerter.shared.createDefaultAlert(controller: self, alertTitle: "Error", alertMessage: "Passwords do not match")
            } else {
                //TODO: Do registering here
                
            }
            
        } else {
            
            //alert empty fields
            Alerter.shared.createDefaultAlert(controller: self, alertTitle: "Error", alertMessage: "Empty Fields")
            
        }
    }
    
    
    @IBAction func onSignIn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
