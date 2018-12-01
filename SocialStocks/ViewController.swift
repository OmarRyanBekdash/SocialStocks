//
//  ViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var usernameText: UITextField!
    var passwordText: UITextField!
    
    var usernameLabel: UILabel!
    var passwordLabel: UILabel!
    
    var signInButton: UIButton!
    var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Sign In"
        view.backgroundColor = UIColor.init(red: 47/255, green: 203/255, blue: 89/255, alpha: 1.0)
        
        usernameText = UITextField()
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        usernameText.text = "Enter Username"
        usernameText.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        usernameText.textAlignment = .left
        usernameText.textColor = .black
        view.addSubview(usernameText)
        
        passwordText = UITextField()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.text = "Enter Password"
        passwordText.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        passwordText.textAlignment = .left
        passwordText.textColor = .black
        view.addSubview(passwordText)
        
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username:"
        usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        usernameLabel.textAlignment = .right
        usernameLabel.textColor = .black
        view.addSubview(usernameLabel)
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password:"
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordLabel.textAlignment = .right
        passwordLabel.textColor = .black
        view.addSubview(passwordLabel)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor.init(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(pushHomeViewController), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor.init(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        signUpButton.layer.cornerRadius = 8
//        signUpButton.addTarget(self, action: #selector(), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        /*let signIn = UIBarItem()
         signIn.title = "Sign In Page"
         self.navigationController?.navigationBar.topItem?.bar = signIn*/
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            ])
        NSLayoutConstraint.activate([
            usernameText.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            usernameText.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 10),
            usernameText.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameLabel.topAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            ])
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: passwordLabel.topAnchor),
            passwordText.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 10),
            passwordText.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 300),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 30),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 50),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    
    @objc func pushHomeViewController() {
//        if usernameText.text == User.username and passwordText.text == User.password {
        let hViewController = HomeViewController()
        self.navigationController?.pushViewController(hViewController, animated: true)
//        dismiss(animated: true, completion: nil)
//        } else {
        
//        }
    }
    // very iffy about dismissing in this function when we already pushed a viewController
    
    @objc func pushMakeAnAccountController() {
        let mViewController = MakeAnAccountViewController()
        self.navigationController?.pushViewController(mViewController, animated: true)
    }


    
}





