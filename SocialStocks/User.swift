//
//  User.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import Foundation

struct User: Decodable{
    
    static var currentUser: User?
    
    let id: Int
    let name: String
    let username: String
    let password: String
    let stocks: [Stock]!
    let friends: [User]!
    
    init(id: Int, name: String, username: String, password: String, stocks: [Stock], friends: [User]) {
        self.id = id
        self.name = name
        self.username = username
        self.password = password
        self.stocks = stocks
        self.friends = friends
    }
    
}

struct UserSearchResponse: Decodable {
    var results: [User]
}

struct UserSignInResponse: Decodable {
    var success: Bool
    var data: User?
    var error: String?
}
