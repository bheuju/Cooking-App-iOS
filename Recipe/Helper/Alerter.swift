//
//  Alerter.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/7/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import Foundation
import UIKit

class Alerter {
    
    static let shared = Alerter()
    
    func createDefaultAlert(controller: UIViewController, alertTitle: String, alertMessage: String) {
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
}
