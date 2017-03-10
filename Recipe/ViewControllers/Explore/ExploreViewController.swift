//
//  ExploreViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/6/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var recipeList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recipeList.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recipeItem")
        
        signInClicked(UIBarButtonItem())
        
        recipeList.delegate = self
        recipeList.dataSource = self
        
    }
}


//MARK: Events
extension ExploreViewController {
    
    @IBAction func signInClicked(_ sender: UIBarButtonItem) {
        
        if let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            
            let navVC = UINavigationController(rootViewController: signInVC)
            self.present(navVC, animated: true, completion: nil)
        }
    }
}


//MARK: RecipeList CollectionView
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecipeData.shared.recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let recipeListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeItem", for: indexPath) as? RecipeCollectionViewCell {
            
            recipeListCell.recipeImage.image = UIImage(named: RecipeData.shared.recipeList[indexPath.row].recipeImage!)
            recipeListCell.recipeTitle.text = RecipeData.shared.recipeList[indexPath.row].recipeTitle
            
            return recipeListCell
            
        }
        
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let recipeDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController {
            
            recipeDetailsVC.recipe = RecipeData.shared.recipeList[indexPath.row]
            self.navigationController?.pushViewController(recipeDetailsVC, animated: true)
            
        }
    }
    
}


