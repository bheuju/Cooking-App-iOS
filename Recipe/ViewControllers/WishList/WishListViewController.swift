//
//  WishListViewController.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/28/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    
    @IBOutlet weak var wishListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wishListTableView.register(UINib(nibName: "WishListTableViewCell", bundle: nil), forCellReuseIdentifier: "wishListItemCell")
        
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
        
        //Automatic height dimensioning
        wishListTableView.rowHeight = UITableViewAutomaticDimension
        wishListTableView.estimatedRowHeight = 100
        
    }
    
}


//MARK: TableView Methods
extension WishListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return WishListData.shared.wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = wishListTableView.dequeueReusableCell(withIdentifier: "wishListItemCell") as! WishListTableViewCell
        
        //cell.textLabel?.text = WishListData.shared.wishList[indexPath.row].recipeTitle
        
        cell.wishListItemTitle.text = WishListData.shared.wishList[indexPath.row].recipeTitle
        cell.wishListItemImage.image = UIImage(named: WishListData.shared.wishList[indexPath.row].recipeImage!)
        cell.wishListItemReview.text = WishListData.shared.wishList[indexPath.row].recipeReview
        
        return cell
    }
    
    
}
