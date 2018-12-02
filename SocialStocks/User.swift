//
//  User.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import Foundation

struct User: Codable{
    
    static var currentUser: User?
    
    let id: Int
//    let name: String
    let username: String
    let password: String
    let email: String
    let profile_pic_url: String
//    let stocks: [Stock]!
//    let friends: [User]!
    
//    enum CodingKeys: String, CodingKey
//    {
//        case id, email, username, password
//    }
    
    init(id: Int, username: String, password: String, email: String, profile_pic_url: String) {
        self.id = id
//        self.name = name
        self.username = username
        self.password = password
        self.email = email
        self.profile_pic_url = profile_pic_url
//        self.stocks = stocks
//        self.friends = friends
    }
    
}

struct UserSearchResponse: Decodable {
    var results: [User]
}

struct UserSignInResponse: Codable {
    var success: Bool
    var data: User?
    var error: String?
}

struct MakeFriendResponse: Codable {
    var success: Bool
    var data: String?
    var error: String?
}

struct UserUpdateResponse: Codable {
    var success: Bool
    var data: User?
    var error: String?
}

