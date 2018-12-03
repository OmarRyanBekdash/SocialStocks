//
//  Stock.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import Foundation

struct Stock: Codable{
    
//    var currentStock: [Stock]?
    
    var id: Int
    var company: String
    var amount: Int
    var price: Double
    var method: String
    var text: String
    var time: String
//    let open: String
//    let close: String
//    let volume: String
//    let high: String
//    let low: String
//    let change: String
//    let percentChanged: String
    
    enum CodingKeys: String, CodingKey
    {
        case id, company, amount, price, method, text, time
    }

    init(id: Int, company: String, price: Double, amount: Int, method: String, text: String, time: String, image: UIImage!, open: String, close: String, volume: String, high: String, low: String, change: String, percentChanged: String) {
        self.id = id
        self.company = company
        self.price = price
        self.amount = amount
        self.method = method
        self.text = text
        self.time = time
//        self.open = "Open: " + open
//        self.close = "Close: " + close
//        self.volume = "Volume: " + volume
//        self.high = "High: " + high
//        self.low = "Low: " + low
//        self.change = "Change: " + change
//        self.percentChanged = "Percent Changed: " + percentChanged
    }

}

struct StockSearchResponse: Codable {
    var success: Bool
    var data: [Stock]
    //var error: String
}

struct PrivacyResponse: Codable {
    var success: String
    var data: [Stock]
//    var error: String
}
