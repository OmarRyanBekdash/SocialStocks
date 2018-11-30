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
    
    private static let friendsInvestmentURL = "http://localhost:6000/api/investments/"
    
//    private static let companyURL = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={}&apikey={}"
    
    //private static let priceURL = ""
    //URL's might not be different
    
    static func getInvestment(fromCompany company: String, _ didGetInvestments: @escaping ([Stock]) -> Void) {
        
        let parameters :[String:Any] =
        [
            "q": company
        ]
        Alamofire.request(friendsInvestmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                
                let jsonDecoder = JSONDecoder()
                
                if let company = try? jsonDecoder.decode(StockSearchResponse.self, from: data) { //everything online says to make a struct, but in p7 we didn't make a struct, and RecipeSearchResponse worked
                    didGetInvestments(company.results)
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
        Alamofire.request(friendsInvestmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
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
        Alamofire.request(friendsInvestmentURL, method: .get, parameters: parameters).validate().responseData{ (response) in
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
    
}

