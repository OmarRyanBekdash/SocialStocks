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
    
    var navigationBar: UINavigationBar!
    //self.User = userInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Sign In"
        view.backgroundColor = .white
        
        usernameText = UITextField()
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        usernameText.placeholder = "Enter Username"
        usernameText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        usernameText.textAlignment = .left
        usernameText.textColor = .black
        usernameText.borderStyle = .roundedRect
        usernameText.delegate = self
        usernameText.clearButtonMode = UITextField.ViewMode.unlessEditing
        view.addSubview(usernameText)
        
        passwordText = UITextField()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.placeholder = "Enter Password"
        passwordText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordText.textAlignment = .left
        passwordText.textColor = .black
        passwordText.borderStyle = .roundedRect
        passwordText.delegate = self
        passwordText.clearButtonMode = UITextField.ViewMode.unlessEditing
        view.addSubview(passwordText)
        
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username"
        usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        usernameLabel.textAlignment = .left
        usernameLabel.textColor = .black
        view.addSubview(usernameLabel)
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .black
        view.addSubview(passwordLabel)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(pushHomeViewController), for: .touchUpInside)
//        signInButton.textColor = .black
        view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        signUpButton.layer.cornerRadius = 8
        signUpButton.addTarget(self, action: #selector(pushMakeAnAccountController), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        /*let signIn = UIBarItem()
         signIn.title = "Sign In Page"
         self.navigationController?.navigationBar.topItem?.bar = signIn*/
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        NSLayoutConstraint.activate([
            usernameText.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            usernameText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameText.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            usernameText.heightAnchor.constraint(equalToConstant: 25)
            ])
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            passwordLabel.heightAnchor.constraint(equalToConstant: 16),
            passwordLabel.topAnchor.constraint(equalTo: usernameText.bottomAnchor, constant: 20)
            ])
        NSLayoutConstraint.activate([
            passwordText.leadingAnchor.constraint(equalTo: usernameText.leadingAnchor),
            passwordText.trailingAnchor.constraint(equalTo: usernameText.trailingAnchor),
            passwordText.heightAnchor.constraint(equalToConstant: 25),
            passwordText.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 50),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.leadingAnchor.constraint(equalTo: usernameText.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: usernameText.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor.constraint(equalTo: usernameText.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: usernameText.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 60)
            ])
        
    }
    
    @objc func pushHomeViewController() {
        NetworkManager.userSignIn(fromUsername: usernameText.text!, fromPassword: passwordText.text!) { (userSignInResponse) in
            User.currentUser = userSignInResponse.data
            if userSignInResponse.success == true {
                let hViewController = HomeViewController()
                self.navigationController?.pushViewController(hViewController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Error", message: "\(userSignInResponse.error!)", preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    @objc func pushMakeAnAccountController() {
        let mViewController = MakeAnAccountViewController()
        self.navigationController?.pushViewController(mViewController, animated: true)
    }


    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}





