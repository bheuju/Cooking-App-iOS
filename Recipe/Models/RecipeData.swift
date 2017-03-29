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
        recipeList.append(Recipe(recipeId: 1, recipeTitle: "Burgers", recipeImage: "burgers.jpg", recipeFavourited: true, recipeReview: "This is a review for burgers. A"))
        
        recipeList.append(Recipe(recipeId: 2, recipeTitle: "Pizza", recipeImage: "pizza.jpg", recipeFavourited: false, recipeReview: "Pizza is a yeasted ")) //flatbread generally topped with tomato sauce and cheese and baked in an oven. It is commonly topped with a selection of meats, vegetables and condiments.
        
        //recipeList.append(Recipe(recipeTitle: "Seafood", recipeImage: "seafood.jpg", recipeFavourited: false, recipeReview: "Seafoods do not actually come from sea"))
        
        //recipeList.append(Recipe(recipeTitle: "Sushi", recipeImage: "sushi.jpg", recipeFavourited: true, recipeReview: "Are sushi japanese dish?"))
    }

}
