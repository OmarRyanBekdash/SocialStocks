//
//  User.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import Foundation

class User{
    
    var name: String
    var username: String
    var password: String
    var stocks: [Stock]!
    var friends: [User]!
    
    init(name: String, username: String, password: String, stocks: [Stock], friends: [User]) {
        self.name = name
        self.username = username
        self.password = password
        self.stocks = stocks
        self.friends = friends
    }
    
}
