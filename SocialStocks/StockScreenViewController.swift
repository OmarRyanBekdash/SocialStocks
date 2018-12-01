//
//  StockScreenViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit

class StockScreenViewController: UIViewController {
    
    var row: Int!
    
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var stockView: UIImageView!
    
//    weak var delegate: SaveStock?
    
    let reuseIdentifier = "stockCellReuse"
    let cellHeight: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Personal Stocks"
        view.backgroundColor = UIColor.init(red: 130, green: 158, blue: 161, alpha: 1.0)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Stock + name whatever it is"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "Price + $$"
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        priceLabel.textAlignment = .left
        priceLabel.textColor = .black
        view.addSubview(priceLabel)
        
//        let back = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backMethod))
//        self.navigationItem.leftBarButtonItem = back
        
        
        stockView = UIImageView()
        stockView.translatesAutoresizingMaskIntoConstraints = false
        stockView.contentMode = .scaleAspectFit
        view.addSubview(stockView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            priceLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            stockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stockView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stockView.heightAnchor.constraint(equalToConstant: 200),
            stockView.widthAnchor.constraint(equalToConstant: 300)
            ])
        
    }
//    
//    @objc func backMethod() {
//        // If let statements can also chain boolean checks after them, like a normal if statement.
//        navigationController?.pushViewController(HomeViewController(), animated: true)
//    }

    
    
}
