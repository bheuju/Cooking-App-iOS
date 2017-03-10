//
//  SignInViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/7/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let defaultUsername = "bishal"
    let defaultPassword = "heuju"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func checkLogin() {
        if (username.text == defaultUsername && password.text == defaultPassword){
            print("Login Successful")
        } else {
            print("Invalid Login")
        }
    }
    
    
}


//MARK: Events
extension SignInViewController {
    
    @IBAction func onSignIn(_ sender: UIButton) {
        checkLogin()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        if let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.navigationController?.present(registerVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func onForgotPassword(_ sender: UIButton) {
        //Forgot password alertbox implementation here
        Alerter.shared.createDefaultAlert(controller: self, alertTitle: "Success", alertMessage: "A password reset link as been sent to your email")
    }
    
    @IBAction func onSkip(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


// MARK: UITextField Details
extension SignInViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
