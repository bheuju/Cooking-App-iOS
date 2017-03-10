//
//  Recipe.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/6/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import Foundation

class Recipe {
    
    let recipeTitle: String?
    let recipeImage: String?
    let recipeFavourited: Bool?
    let recipeReview: String?

    init(recipeTitle:String, recipeImage:String, recipeFavourited:Bool, recipeReview:String) {
        self.recipeTitle = recipeTitle
        self.recipeImage = recipeImage
        self.recipeFavourited = recipeFavourited
        self.recipeReview = recipeReview
    }
    
    
}
