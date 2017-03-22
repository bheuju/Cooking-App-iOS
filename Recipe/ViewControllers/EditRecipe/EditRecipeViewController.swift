//
//  EditRecipeViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/14/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

class EditRecipeViewController: UIViewController {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeReview: UITextView!
    
    
    var recipe: Recipe?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let _ = recipe else {
            return
        }
        
        initialSetup()
    }

    
    
    func initialSetup() {
        recipeTitle.text = recipe?.recipeTitle
        recipeImage.image = UIImage(named: (recipe?.recipeImage)!)
        recipeReview.text = recipe?.recipeReview
    }

}
