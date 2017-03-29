//
//  WishList.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/28/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import Foundation

class WishListData {
    static let shared = WishListData()
    
    var wishList:[Recipe] = []
    
    var index = 0
    
    init() {
        initWishList()
    }
    
    
    func initWishList() {
       
        wishList.append(RecipeData.shared.recipeList[1])    //Pizza
        wishList.append(RecipeData.shared.recipeList[3])    //Sushi
        
    }
    
}
