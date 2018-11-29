//
//  AddFriendViewController.swift
//  SocialStocksApp
//
//  Created by Omar Beckdash on 11/29/18.
//  Copyright © 2018 Omar Bekdash. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    var friendText: UITextField!
    var friendLabel: UILabel!
    var friendButton: UIButton!
    
    override func viewDidLoad() {
        
        friendText = UITextField()
        friendText.translatesAutoresizingMaskIntoConstraints = false
        friendText.borderStyle = .roundedRect
        friendText.font = UIFont.systemFont(ofSize: 16, weight: .light)
        friendText.text = "Enter Friend's Name"
        friendText.textAlignment = .left
        friendText.textColor = .black
        view.addSubview(friendText)
        
        friendLabel = UILabel()
        friendLabel.translatesAutoresizingMaskIntoConstraints = false
        friendLabel.text = "Enter the name of your friend:"
        friendLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        friendLabel.textAlignment = .right
        friendLabel.textColor = .black
        view.addSubview(friendLabel)
        
        friendButton = UIButton()
        friendButton.translatesAutoresizingMaskIntoConstraints = false
        friendButton.setTitle("Add Friend", for: .normal)
        friendButton.backgroundColor = .white
        friendButton.setTitleColor(.blue, for: .normal)
        friendButton.addTarget(self, action: #selector(dismissModalViewControllerAndSaveText), for: .touchUpInside)
        view.addSubview(friendButton)
        
        setupConstraints()
        
    }
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            friendLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            friendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            friendLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            ])
        NSLayoutConstraint.activate([
            friendText.topAnchor.constraint(equalTo: friendLabel.topAnchor),
            friendText.leadingAnchor.constraint(equalTo: friendLabel.trailingAnchor, constant: 10),
            friendText.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            friendButton.topAnchor.constraint(equalTo: friendLabel.topAnchor, constant: 50),
            friendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            friendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            friendButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    
    @objc func dismissModalViewControllerAndSaveText() {
        if let text = friendText.text, text != "" {
            //add friend in database
            self.navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
