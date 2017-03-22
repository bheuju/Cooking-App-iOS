//
//  RecipeData.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/6/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import Foundation

class RecipeData {
    static let shared = RecipeData()
    
    var recipeList:[Recipe] = []
    
    var index = 0
    
    init() {
        initRecipeList()
    }
    
    
    func initRecipeList() {
        recipeList.append(Recipe(recipeTitle: "Burgers", recipeImage: "burgers.jpg", recipeFavourited: true, recipeReview: "This is a review for burgers"))
        
        recipeList.append(Recipe(recipeTitle: "Pizza", recipeImage: "pizza.jpg", recipeFavourited: false, recipeReview: "Pizzas are round"))
        
        //recipeList.append(Recipe(recipeTitle: "Seafood", recipeImage: "seafood.jpg", recipeFavourited: false, recipeReview: "Seafoods do not actually come from sea"))
        
        //recipeList.append(Recipe(recipeTitle: "Sushi", recipeImage: "sushi.jpg", recipeFavourited: true, recipeReview: "Are sushi japanese dish?"))
    }

}
