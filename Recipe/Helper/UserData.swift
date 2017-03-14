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
    
    
    private var loggedInUser:User?
    
    private let defaultUser = User(username: "guest", password: "guest")
    
    private var userList:[User] = []
    
    init() {
        initUserData()
    }
    
    
    func initUserData() {
        
        userList.append(User(username: "admin", password: "admin"))
        userList.append(User(username: "b.heuju", password: "google"))
        
    }
 
    
    func getUser() -> User? {
        return loggedInUser
    }
    
    func getUser(user: User) -> Bool {
        
        for u in userList {
            if u.username == user.username {
                //User Exists
                if u.password == user.password {
                    //Password matched
                    //Login succesful
                    loggedInUser = User(username: user.username!, password: user.password!)
                    return true
                }
            }
        }
        
        return false
    }
}
