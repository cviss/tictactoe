//
//  User.swift
//  TicTacToe
//
//  Created by System Administrator on 6/30/16.
//  Copyright © 2016 Colicinus. All rights reserved.
//

import Foundation

class User {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
//    var hashValue: Int {
//        return "\(username),\(password)".hashValue
//    }
    
}

//func ==(a: User, b: User) -> Bool {
//    return a.username == b.username && a.password == b.password
//}
