//
//  UserController.swift
//  TicTacToe
//
//  Created by System Administrator on 6/30/16.
//  Copyright © 2016 Colicinus. All rights reserved.
//

import Foundation

class UserController {
    static var sharedInstance = UserController()
    var currentUser: User?
    var userDictionary = [String: User]()
    
    
    func registerUser(username: String, password: String, onCompletion: (User?, String?) -> Void) {
        
        guard username != "" else {
            onCompletion(nil, "Please enter a username.")
            return
        }
        guard password.characters.count >= 6 else {
            onCompletion(nil, "Password must be longer than 6 characters")
            return
        }
        guard userDictionary[username] == nil else {
            onCompletion(nil, "User already exists.")
            return
        }
        
        let user = User(username: username, password: password)
        userDictionary[username] = user
        
    }
    
    func loginUser(username: String, password: String, onCompletion: (User?, String?) -> Void) {
        if let user = userDictionary[username] {
            guard user.password == password else {
                onCompletion(nil, "Incorrect Password")
                return
            }
            currentUser = user
        }
    }
    
    func logout(onCompletion: (String?) -> Void) {
        
    }
}
