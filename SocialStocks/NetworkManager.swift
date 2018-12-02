//
//  NetworkManager.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/29/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


enum SearchType {
        case company
        case price
        case amount
        //case method
}

// all errors are associated with the lack of URL to query for the JSON
class NetworkManager {
    
    private static let investmentURL = "http://35.196.119.50/api/investments/"
    private static let userQueryURL = "http://35.196.119.50/api/user/"
    
    
//    private static let companyURL = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={}&apikey={}"
    
    //private static let priceURL = ""
    //URL's might not be different
    
    static func getInvestment(fromCompany company: String, _ didGetStock: @escaping ([Stock]) -> Void) {
        
        let parameters :[String:Any] =
        [
            "q": company
        ]
        Alamofire.request(investmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let company = try? jsonDecoder.decode(StockSearchResponse.self, from: data) { //everything online says to make a struct, but in p7 we didn't make a struct, and RecipeSearchResponse worked
                    didGetStock(company.results)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    static func getInvestment(fromAmount amount: String, _ didGetInvestments: @escaping ([Stock]) -> Void) {
        
        let parameters : [String:Any] =
        [
            "q": amount
        ]
        Alamofire.request(investmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let amount = try? jsonDecoder.decode(StockSearchResponse.self, from: data) {
                    didGetInvestments(amount.results)
                } else {
                    print("Invalid Data")
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    static func getInvestment(fromPrice price: String, _ didGetInvestments: @escaping ([Stock]) -> Void) {
        
        let parameters : [String:Any] =
        [
            "q": price
        ]
        Alamofire.request(investmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let price = try? jsonDecoder.decode(StockSearchResponse.self, from: data) {
                    didGetInvestments(price.results)
                } else {
                    print("Invalid Data")
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func userSignIn(fromUsername username: String, fromPassword password: String, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
        
        let parameters :[String:Any] =
            [
                "username": username,
                "password": password
        ]
        Alamofire.request(userQueryURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let user = try? jsonDecoder.decode(UserSignInResponse.self, from: data) {
                    didGetUser(user)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    static func userSignUp(fromUsername username: String, fromPassword password: String, fromEmail email: String, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
        
        let parameters :[String:Any] =
            [
                "username": username,
                "password": password,
                "email": email
        ]
        Alamofire.request(userQueryURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let user = try? jsonDecoder.decode(UserSignInResponse.self, from: data) {
                    didGetUser(user)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    static func editUser(fromEmail email: String, fromUsername username: String, fromPassword password: String, fromUser user: Int, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
        
        let user_id = User.currentUser?.id
        let editUserURL = "http://35.196.119.50/api/\(user_id)/"
        
        let parameters :[String:Any] =
            [
                "email": email,
                "username": username,
                "password": password
            ]
        Alamofire.request(editUserURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let user = try? jsonDecoder.decode(UserSignInResponse.self, from: data) {
                    didGetUser(user)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
        
    }
    
//    static func makeFriend(fromUser user: Int, fromFriend friend_id: Int, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
//        
//        let user_id = User.currentUser.id
//        let editUserURL = "http://35.196.119.50/api/\(user_id)/"
//        
//        let parameters :[String:Any] =
//            [
//                "email": email,
//                "username": username,
//                "password": password
//            ]
//        Alamofire.request(editUserURL, method: .get, parameters: parameters).validate().responseData{ (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                
//                let jsonDecoder = JSONDecoder()
//                
//                if let user = try? jsonDecoder.decode(UserSignInResponse.self, from: data) {
//                    didGetUser(user)
//                } else {
//                    print("Invalid Data")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//            
//            
//        }
//        
//    }
    
}
