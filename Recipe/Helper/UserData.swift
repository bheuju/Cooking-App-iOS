//
//  UserData.swift
//  Recipe
//
//  Created by Bishal Heuju on 3/10/17.
//  Copyright © 2017 Bishal Heuju. All rights reserved.
//

import Foundation

class UserData {

    static let shared = UserData()
    
    var userList:[User] = []
    
    init() {
        initUserData()
    }
    
    
    
    func initUserData() {
    
        userList.append(User(username: "admin", password: "admin"))
        userList.append(User(username: "b.heuju", password: "google"))
        
    }
    
}
