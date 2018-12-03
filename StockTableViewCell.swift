//
//  StockTableViewCell.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    var companyLabel: UILabel!
    var priceLabel: UILabel!
    var amountLabel: UILabel!
    var stockView: UIImageView!
    
    let padding: CGFloat = 12
    let fieldHeight: CGFloat = 13
    let anImageHeight: CGFloat = 70
    let anImageWidth: CGFloat = 70
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        companyLabel = UILabel()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.font = UIFont.systemFont(ofSize: 13)
        companyLabel.textColor = .black
        contentView.addSubview(companyLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 13)
        priceLabel.textColor = .black
        contentView.addSubview(priceLabel)
        
        amountLabel = UILabel()
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.systemFont(ofSize: 13)
        amountLabel.textColor = .black
        contentView.addSubview(amountLabel)
        
        stockView = UIImageView()
        stockView.translatesAutoresizingMaskIntoConstraints = false
        stockView.contentMode = .scaleAspectFit
        contentView.addSubview(stockView)
        
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            companyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            companyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            companyLabel.heightAnchor.constraint(equalToConstant: fieldHeight)
            ])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: companyLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: padding),
            priceLabel.heightAnchor.constraint(equalToConstant: fieldHeight)
            ])
        
        NSLayoutConstraint.activate([
            amountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: padding),
            amountLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            amountLabel.heightAnchor.constraint(equalToConstant: fieldHeight)
            ])
        
        NSLayoutConstraint.activate([
            stockView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            stockView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stockView.heightAnchor.constraint(equalToConstant: anImageHeight),
            stockView.widthAnchor.constraint(equalToConstant: anImageWidth)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for stock: Stock) {
        
        companyLabel.text = stock.company
        priceLabel.text = "\(stock.price)"
        amountLabel.text = "\(stock.amount)"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
