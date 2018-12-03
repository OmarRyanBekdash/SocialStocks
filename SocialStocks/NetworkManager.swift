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
    
    private static let investmentURL = "http://35.196.240.185/api/investments/"
    private static let userQueryURL = "http://35.196.240.185/api/user/"
    
    
    private static let companyURL = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={}&apikey={}"
    
    private static let priceURL = ""
    //URL's might not be different
    
    static func getInvestment(fromCompany company: String, fromAmount amount: String, fromPrice price: String, _ didGetStock: @escaping ([Stock]) -> Void) {

        let parameters :[String:Any] =
        [
            "company": company,
            "amount": amount,
            "price": price
        ]
        Alamofire.request(investmentURL, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: nil).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }

                let jsonDecoder = JSONDecoder()

                if let stockSearchResponse = try? jsonDecoder.decode(StockSearchResponse.self, from: data) {
                    didGetStock(stockSearchResponse.data)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
        }
    }
}
    
    static func getInvestment(_ didGetStock: @escaping ([Stock]) -> Void) {
        Alamofire.request(investmentURL, method: .get, encoding: JSONEncoding.default, headers: nil).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let stocksSearchResponse = try? jsonDecoder.decode(StockSearchResponse.self, from: data) {
                    didGetStock(stocksSearchResponse.data)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    

//    static func getInvestment(fromAmount amount: String, _ didGetInvestments: @escaping ([Stock]) -> Void) {
//
//        let parameters : [String:Any] =
//        [
//            "q": amount
//        ]
//        Alamofire.request(investmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//
//                let jsonDecoder = JSONDecoder()
//
//                if let amount = try? jsonDecoder.decode(StockSearchResponse.self, from: data) {
//                    didGetInvestments(amount.results)
//                } else {
//                    print("Invalid Data")
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//
//        }
//    }
//
//    static func getInvestment(fromPrice price: String, _ didGetInvestments: @escaping ([Stock]) -> Void) {
//
//        let parameters : [String:Any] =
//        [
//            "q": price
//        ]
//        Alamofire.request(investmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//
//                let jsonDecoder = JSONDecoder()
//
//                if let price = try? jsonDecoder.decode(StockSearchResponse.self, from: data) {
//                    didGetInvestments(price.results)
//                } else {
//                    print("Invalid Data")
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    static func userSignIn(fromUsername username: String, fromPassword password: String, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
        
        let parameters :[String:Any] =
            [
                "username": username,
                "password": password
            ]
        Alamofire.request(userQueryURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let userSignIn = try? jsonDecoder.decode(UserSignInResponse.self, from: data) {
                    didGetUser(userSignIn)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
//        Alamofire.request(userQueryURL, method: .post, parameters: parameters).validate().responseData{ (response) in
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
    }
    
    static func userSignUp(fromUsername username: String, fromPassword password: String, fromEmail email: String, fromConfirmPassword confirmPassword: String, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
        
        let parameters :[String:Any] = [
                "username": username,
                "password": password,
                "email": email
        ]
        Alamofire.request(userQueryURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseData{ (response) in
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
    
    static func editUser(fromUser user_id: Int, fromEmail email: String, fromUsername username: String, fromPassword password: String, fromConfirmPassword confirmPassword: String, fromProfilePicURL profile_pic_url: String, _ didGetUser: @escaping (UserUpdateResponse) -> Void) {
        
        let editUserURL = "http://35.196.240.185/api/user/\(user_id)/"
        
        let parameters :[String:Any] =
            [
                "email": email,
                "username": username,
                "password": password,
                "profile_pic_url": profile_pic_url
            ]
        Alamofire.request(editUserURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let updatedUser = try? jsonDecoder.decode(UserUpdateResponse.self, from: data) {
                    didGetUser(updatedUser)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func makeFriend(fromUser user_id: Int, fromFriend friend_id: Int, _ didGetUser: @escaping (MakeFriendResponse) -> Void) {

        let makeFriendURL = "http://35.196.240.185/api/friend/\(user_id)/\(friend_id)/"
        // http://35.196.240.185/api/friend/3/4
        // http://35.196.240.185/api/friend/?user_id=3&friend_id=4
        
        Alamofire.request(makeFriendURL, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let makeFriendResponse = try? jsonDecoder.decode(MakeFriendResponse.self, from: data) {
                    didGetUser(makeFriendResponse)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    static func getUser(fromUser user_id: Int, _ didGetUser: @escaping (UserSignInResponse) -> Void) {
        let getUserURL = "http://35.196.240.185/api/user/\(user_id)/"
        
        Alamofire.request(getUserURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
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
    
    static func turnPrivacy(fromUser user_id: Int, _ didGetUser: @escaping (PrivacyResponse) -> Void) {
        
        let privacyChangeOutputURL = "http://35.196.240.185/api/investments/a/\(user_id)/final/"
        
        Alamofire.request(privacyChangeOutputURL, method: .get, encoding: URLEncoding.queryString, headers: nil).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let updatedUser = try? jsonDecoder.decode(PrivacyResponse.self, from: data) {
                    didGetUser(updatedUser)
                } else {
                    print("Invalid Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    static func getFriends(fromUser user_id: Int, _ didGetUser: @escaping (PrivacyResponse) -> Void) {
//        
//        let getFriendsURL = "http://35.196.240.185/api/\(user_id)/friends/"
//        
//        Alamofire.request(getFriendsURL, method: .get, encoding: URLEncoding.default, headers: nil).validate().responseData{ (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                
//                let jsonDecoder = JSONDecoder()
//                
//                if let updatedUser = try? jsonDecoder.decode(PrivacyResponse.self, from: data) {
//                    didGetUser(updatedUser)
//                } else {
//                    print("Invalid Data")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    
}
