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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func checkLogin() {
        if UserData.shared.getUser(user: User(username: username.text!, password: password.text!)) {
            //Alerter.shared.createDefaultAlert(controller: self, alertTitle: "Success", alertMessage: "Login Successful")
            
            // SignInSuccess Notification broadcast
            NotificationCenter.default.post(name: Notification.Name(SIGN_IN_NOTIFICATION_KEY), object: self)
            
        }
    }
    
    
}


//MARK: Events
extension SignInViewController {
    
    @IBAction func onSignIn(_ sender: UIButton) {
        
        checkLogin()
        //TODO: After checkLogin() dissmiss signInVC nav ctrl
        
        self.dismiss(animated: true, completion: nil)       // TODO: This dismisses alertbox of successful login
        
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        if let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.navigationController?.present(registerVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func onForgotPassword(_ sender: UIButton) {
        
        //TODO: Alert on forgot password completion handler
        
        //Forgot password alertbox implementation here
        Alerter.shared.createDefaultAlert(controller: self, alertTitle: "Success", alertMessage: "A password reset link has been sent to your email")
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
