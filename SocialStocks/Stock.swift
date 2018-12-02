//
//  Stock.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import Foundation

struct Stock: Decodable{
    let company: String
    let price: String
    let amount: String
    
    init(company: String, price: String, amount: String, image: UIImage!) {
        self.company = "Stock: " + company
        self.price = "Price: " + price
        self.amount = "Amount: " + amount
    }
    
}

struct StockSearchResponse: Decodable {
    var results: [Stock]
}

struct PrivacyResponse: Decodable {
    var success: Bool
    var data: [Stock]?
    var error: String?
}
