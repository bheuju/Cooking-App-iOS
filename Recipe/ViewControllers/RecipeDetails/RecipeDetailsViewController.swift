//
//  RecipeDetailsViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/6/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeFavourited: UIButton!
    @IBOutlet weak var recipeReview: UILabel!
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let _ = recipe else {
            let _ = self.navigationController?.popViewController(animated: true)
            return
        }
        setRecipe(myRecipe: recipe!)
    }
    
    
    func setRecipe(myRecipe:Recipe) {
        
        //print(myRecipe.recipeTitle!)
        
        recipeTitle.text = myRecipe.recipeTitle!
        recipeImage.image = UIImage(named: myRecipe.recipeImage!)
        
        if myRecipe.recipeFavourited! {
            recipeFavourited.setImage(UIImage(named: "heart-selected"), for: .normal)
        } else {
            recipeFavourited.setImage(UIImage(named: "heart-unselected"), for: .normal)
        }
        
        recipeReview.text = myRecipe.recipeReview!
    }
    
    @IBAction func favouriteButtonClicked(_ sender: UIButton) {
        //toggle favourite button
        print("favourite clicked")
    }
    
    
}


