//
//  StockTableViewCell.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    var stockLabel: UILabel!
    var openLabel: UILabel!
    var closeLabel: UILabel!
    var volumeLabel: UILabel!
    var highLabel: UILabel!
    var lowLabel: UILabel!
    var changeLabel: UILabel!
    var percentChangedLabel: UILabel!
    
    let padding: CGFloat = 12
    let fieldHeight: CGFloat = 13
    let anImageHeight: CGFloat = 70
    let anImageWidth: CGFloat = 70
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stockLabel = UILabel()
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        stockLabel.text = "Stock"
        stockLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        stockLabel.textAlignment = .left
        stockLabel.textColor = .black
        view.addSubview(stockLabel)
        
        changeLabel = UILabel()
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.text = "Change..."
        changeLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        changeLabel.textAlignment = .right
        changeLabel.textColor = .green
        view.addSubview(changeLabel)
        
        changePercentLabel = UILabel()
        changePercentLabel.translatesAutoresizingMaskIntoConstraints = false
        changePercentLabel.text = "Change %"
        changePercentLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        changePercentLabel.textAlignment = .right
        changePercentLabel.textColor = .red
        view.addSubview(changePercentLabel)
        
        
        graphView = UIImageView()
        let graph = UIImage(named: "green.png")
        graphView.translatesAutoresizingMaskIntoConstraints = false
        graphView.image = graph
        view.addSubview(graphView)
        
        
        volumeLabel = UILabel()
        volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        volumeLabel.text = "Volume\t\t\tdata"
        volumeLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        volumeLabel.textAlignment = .left
        volumeLabel.textColor = .black
        view.addSubview(volumeLabel)
        
        highLabel = UILabel()
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        highLabel.text = "High\t\t\tdata"
        highLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        highLabel.textAlignment = .left
        highLabel.textColor = .black
        view.addSubview(highLabel)
        
        lowLabel = UILabel()
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        lowLabel.text = "Low\t\t\tdata"
        lowLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        lowLabel.textAlignment = .left
        lowLabel.textColor = .black
        view.addSubview(lowLabel)
        
        openLabel = UILabel()
        openLabel.translatesAutoresizingMaskIntoConstraints = false
        openLabel.text = "Open\t\t\tdata"
        openLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        openLabel.textAlignment = .right
        openLabel.textColor = .black
        view.addSubview(openLabel)
        
        closeLabel = UILabel()
        closeLabel.translatesAutoresizingMaskIntoConstraints = false
        closeLabel.text = "Close\t\t\tdata"
        closeLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        closeLabel.textAlignment = .right
        closeLabel.textColor = .black
        view.addSubview(closeLabel)
        
        
        setupConstraints()
        
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            stockLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stockLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            changeLabel.topAnchor.constraint(equalTo: stockLabel.topAnchor),
            changeLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            changeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            changePercentLabel.topAnchor.constraint(equalTo: changeLabel.bottomAnchor, constant: 5),
            changePercentLabel.leadingAnchor.constraint(equalTo: changeLabel.leadingAnchor),
            changePercentLabel.trailingAnchor.constraint(equalTo: changeLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            graphView.topAnchor.constraint(equalTo: changePercentLabel.bottomAnchor, constant: 20),
            graphView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            graphView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            graphView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            volumeLabel.topAnchor.constraint(equalTo: graphView.bottomAnchor, constant: 20),
            volumeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        NSLayoutConstraint.activate([
            highLabel.topAnchor.constraint(equalTo: volumeLabel.bottomAnchor, constant: 10),
            highLabel.leadingAnchor.constraint(equalTo: stockLabel.leadingAnchor),
            highLabel.trailingAnchor.constraint(equalTo: stockLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            lowLabel.topAnchor.constraint(equalTo: highLabel.bottomAnchor, constant: 10),
            lowLabel.leadingAnchor.constraint(equalTo: stockLabel.leadingAnchor),
            lowLabel.trailingAnchor.constraint(equalTo: stockLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            openLabel.topAnchor.constraint(equalTo: highLabel.topAnchor),
            openLabel.leadingAnchor.constraint(equalTo: highLabel.trailingAnchor),
            openLabel.trailingAnchor.constraint(equalTo: changeLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            closeLabel.topAnchor.constraint(equalTo: lowLabel.topAnchor),
            closeLabel.leadingAnchor.constraint(equalTo: openLabel.leadingAnchor),
            closeLabel.trailingAnchor.constraint(equalTo: changeLabel.trailingAnchor)
            ])
        
        
        super.updateConstraints()
    }
    
    func configure(for stock: Stock) {
        
        stockLabel.text = stock.title
        openLabel.text = stock.open
        closeLabel.text: stock.close
        volumeLabel.text: stock.volume
        highLabel.text: stock.high
        lowLabel.text: stock.low
        changeLabel.text: stock.change
        percentChangedLabel: stock.percentChanged
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
