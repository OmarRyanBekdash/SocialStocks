//
//  HomeViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import Alamofire
//import CryptoSwift

//protocol UISearchResultsUpdating: class {
//
//    func updateSearchResults()
//}
//    func encrypt(password: String)



class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating  {
    
    
    var stockView: UITableView!
    var dataStocksStarter: [Stock]!
    //var notifications: UIButton!
    //var addFriend: UIButton!
    var filteredStocks = [Stock]()
    
    let reuseIdentifier = "stockCellReuse"
    let cellHeight: CGFloat = 80
    
    var searchController: UISearchController!
//    var searchBar: UISearchBar!
//    maybe???
    
    
    let searchBy: SearchType = .company //Change this to serach by company or different ways
    
    var navigationBar: UINavigationBar!
    
    var header: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        
        //title = "Search"
        
//       let s1 = Stock(company: "Apple", price: "178.32", amount: "150")
//        let s2 = Stock(company: "Microsoft", price: "109.48", amount: "135")
//
//        dataStocksStarter = [s1, s2]
        
        
        
        
        navigationBar = UINavigationBar()
        let navigationItem = UINavigationItem(title: "Search")
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.isTranslucent = false
        navigationBar.barStyle = .blackOpaque
//        navigationBar.barTintColor =
//        .barTintColor attribute??
        navigationBar.tintColor = .gray
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "BackButtonImage")
        view.addSubview(navigationBar)
        
        header = UILabel()
        header.text = "Investment Posts"
        header.textColor = .black
        header.textAlignment = .left
        header.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(header)
        
        

        stockView = UITableView()
        stockView = UITableView(frame: .zero)
        stockView.translatesAutoresizingMaskIntoConstraints = false
        stockView.delegate = self
        stockView.dataSource = self
        stockView.register(StockTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(stockView)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false //lets try out true after debugging
        if searchBy == .company {
            searchController.searchBar.placeholder = "Search by company"
        }
        if searchBy == .amount {
            searchController.searchBar.placeholder = "Search by amount"
        }
        if searchBy == .price {
            searchController.searchBar.placeholder = "Search by price"
        }
//        searchController.searchBar.placeholder = searchBy == .company ?: "Search by company", .amount ?: "Search by amount", .price ?: "Search by price"
        searchController.searchBar.sizeToFit()
        stockView.tableHeaderView = searchController.searchBar
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        
        
//        let notifications = UIBarButtonItem(title: "Notifications", style: UIBarButtonItem.Style.plain, target: self, action: #selector(notificationsButtonTapped))
//        self.navigationItem.leftBarButtonItem = notifications
        
        let settings = UIBarButtonItem(image: UIImage(named: "settingsGear"), style: UIBarButtonItem.Style.done, target: self, action: #selector(settingsButtonTapped))
        self.navigationItem.leftBarButtonItem = settings
        
        
//        let addFriend = UIBarButtonItem(title: "Add Friend", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addFriendButtonTapped))
//        self.navigationItem.rightBarButtonItem = addFriend
//
        
        let addFriend = UIBarButtonItem(image: UIImage(named: "add"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(addFriendButtonTapped))
        addFriend.accessibilityFrame = CGRect(x: 0.0, y: 0.0, width: 10, height: 10)
        self.navigationItem.rightBarButtonItem = addFriend
        
        /*
         notifications = UIButton()
         notifications.translatesAutoresizingMaskIntoConstraints = false
         notifications.setTitle("Notifications", for: .normal)
         notifications.setTitleColor(.blue, for: .normal)
         //notifications.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
         view.addSubview(notifications)*/
        
        /*
         addFriend = UIButton()
         addFriend.translatesAutoresizingMaskIntoConstraints = false
         addFriend.setTitle("Add Friend", for: .normal)
         addFriend.setTitleColor(.red, for: .normal)
         //notifications.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
         view.addSubview(addFriend)*/
        
//        let back = UIBarButtonItem()
//        back.title = "Back"
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = back
//
    

        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            stockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stockView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stockView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stockView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
//        NSLayoutConstraint.activate([
//
//            ])
// for navigation bar?????
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            header.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stockView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! StockTableViewCell
        let stock: Stock
        if isFiltering() {
            stock = filteredStocks[indexPath.row]
        } else {
            stock = dataStocksStarter[indexPath.row]
        }
        cell.configure(for: stock)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 1.0)
        // look at different cell selection styles
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredStocks.count
        }
        
        return dataStocksStarter?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stockViewController = StockScreenViewController()
        //stockViewController.delegate = self
        
        stockViewController.row = indexPath.row
        self.navigationController?.pushViewController(stockViewController, animated: true)
        
        
    }
    
    @objc func settingsButtonTapped() {
        let navViewController = SettingsViewController()
        navigationController?.pushViewController(navViewController, animated: true)
    }
    
    @objc func addFriendButtonTapped() {
        let navViewController = AddFriendsViewController()
        navigationController?.pushViewController(navViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarIsEmpty() -> Bool {
        //returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredStocks = dataStocksStarter.filter({( stock : Stock) -> Bool in
            return stock.company.lowercased().contains(searchText.lowercased())
        })
        
        stockView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                switch searchBy {
                case .company:
                    NetworkManager.getInvestment(fromCompany: searchText) { (investmentsArray) in
                        self.filteredStocks = investmentsArray //update Tableview
                    }
                    
                    DispatchQueue.main.async{
                        self.stockView.reloadData()
                    }
                    print("Search by company")
                case .price:
                    NetworkManager.getInvestment(fromPrice: searchText) { (investmentsArray) in
                        self.filteredStocks = investmentsArray
                    }
                    
                    DispatchQueue.main.async {
                        self.stockView.reloadData()
                    }
                    print("Search by price")
                    
                case .amount:
                    NetworkManager.getInvestment(fromAmount: searchText) { (investmentsArray) in
                        self.filteredStocks = investmentsArray
                    }
                    
                    DispatchQueue.main.async {
                        self.stockView.reloadData()
                    }
                    print("Search by amount")
                }
                
            }
            else {
                self.filteredStocks = []
            }
        }
        self.stockView.reloadData()
    }

}



//extension HomeViewController: {
//
//
//    }

//    func encrypt(password: String) {
//        let password: Array<UInt8> = Array("s33krit".utf8)
//        let salt: Array<UInt8> = Array("nacllcan".utf8)
//
//        let key = try PKCS5.PBKDF2(password: password, salt: salt, iterations: 4096, variant: .sha256).calculate()
//

//}



extension HomeViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

//extension HomeViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContentForSearchText(searchController.searchBar.text!)
//    }
//}
