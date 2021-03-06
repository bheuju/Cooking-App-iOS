//
//  ExploreViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/6/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

import Alamofire

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var recipeListCollectionView: UICollectionView!
    @IBOutlet weak var signInBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recipeListCollectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "recipeItem")
        
        signInClicked(UIBarButtonItem())
        
        recipeListCollectionView.delegate = self
        recipeListCollectionView.dataSource = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onSignIn), name: Notification.Name(SIGN_IN_NOTIFICATION_KEY), object: nil)
        
        
        //startConnection()
        startConnectionAlamofire()
        
        
        if let layout = recipeListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            
            let itemDim = self.view.frame.size.width / 3.0
            
            layout.itemSize = CGSize(width: itemDim, height: itemDim)
        }
    }
    
    
    func onSignIn() {
        
        print("Login Successful")
        //Alerter.shared.createDefaultAlert(controller: self, alertTitle: "Success", alertMessage: "Sign in successful")
        
        //Hide signin button
        signInBtn.isEnabled = false
        signInBtn.tintColor = UIColor.clear
        
    }
}

//MARK: Webservice
extension ExploreViewController {
    
    func startConnection() {
        
        let urlPath = URL(string: CONNECTION_URL)
        
        let task = URLSession.shared.dataTask(with: urlPath!) { data, response, error in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: [])
            print(json)
            
            self.populateRecipeList(json: json)
        }
        task.resume()
    }
    
    
    func startConnectionAlamofire() {
        
        let urlPath = URL(string: CONNECTION_URL)
        
        Alamofire.request(urlPath!).responseJSON {
            response in
            
            //            print(response.response)
            //            print(response.request)
            //            print(response.data)
            //            print(response.result)
            //
            //            print(response.result.value)
            
            self.populateRecipeList(json: response.result.value!)
        }
        
    }
    
    
    func populateRecipeList(json: Any) {
        
        let recipes = (json as! [[String: Any]])
        
        print(recipes.count)
        
        for recipe in recipes {
            
            //print(recipe["title"])
            
            let recipeId = recipe["id"] as! Int
            let recipeTitle = recipe["title"] as! String
            let recipeImage = recipe["image"] as! String
            let recipeFavourited = recipe["favorited"] as! Bool
            let recipeReview = recipe["review"] as! String
            
            let recipe = Recipe(recipeId: recipeId, recipeTitle: recipeTitle, recipeImage: recipeImage, recipeFavourited: recipeFavourited, recipeReview: recipeReview)
            
            RecipeData.shared.recipeList.append(recipe)
            
        }
        
        recipeListCollectionView.reloadData()
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
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    //MARK: CollectionView
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
    
    //MARK: ColectionView Flowlayout
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //        let itemDim = self.view.frame.size.width / 3.0
    //        return CGSize(width: itemDim, height: itemDim)
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //
    //        return UIEdgeInsetsMake(0, 10, 10, 0)
    //    }
    
    
    
    
}


