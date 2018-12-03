//
//  ViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/28/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logoView: UIImageView!
    var logoImage: UIImageView!
    
    var usernameText: UITextField!
    var passwordText: UITextField!
    
    var signInButton: UIButton!
    var signUpButton: UIButton!
    
    var navigationBar: UINavigationBar!
    //self.User = userInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Social Stocks"
        view.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        
        logoView = UIImageView()
        let logo = UIImage(named: "green.png")
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.image = logo
        logoView.clipsToBounds = true
        logoView.contentMode = .scaleAspectFit
        view.addSubview(logoView)
        
        logoImage = UIImageView()
        let pic = UIImage(named: "appLogo.png")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = pic
        logoImage.clipsToBounds = true
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage)
        
        usernameText = UITextField()
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        usernameText.placeholder = "Enter Username"
        usernameText.font = UIFont.systemFont(ofSize: 16, weight: .light)
        usernameText.textAlignment = .left
        usernameText.textColor = .black
        usernameText.borderStyle = .roundedRect
        view.addSubview(usernameText)
        
        let usernameIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        let usernameIcon = UIImage(named: "username-icon.png")
        usernameIconView.image = usernameIcon
        usernameText.leftViewMode = UITextField.ViewMode.always
        usernameText.leftView = usernameIconView
        view.addSubview(usernameIconView)
        
        passwordText = UITextField()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.placeholder = "Enter Password"
        passwordText.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordText.textAlignment = .left
        passwordText.textColor = .black
        passwordText.borderStyle = .roundedRect
        view.addSubview(passwordText)
        
        let passwordIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 18, height: 18))
        let passwordIcon = UIImage(named: "password-icon.png")
        passwordIconView.image = passwordIcon
        passwordText.leftViewMode = UITextField.ViewMode.always
        passwordText.leftView = passwordIconView
        view.addSubview(passwordIconView)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(pushHomeViewController), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        signUpButton.layer.cornerRadius = 8
        signUpButton.addTarget(self, action: #selector(pushMakeAnAccountController), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 150),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
            ])
        NSLayoutConstraint.activate([
            usernameText.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            usernameText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameText.heightAnchor.constraint(equalToConstant: 60)
            ])
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: usernameText.bottomAnchor, constant: 50),
            passwordText.leadingAnchor.constraint(equalTo: usernameText.leadingAnchor),
            passwordText.trailingAnchor.constraint(equalTo: usernameText.trailingAnchor),
            passwordText.heightAnchor.constraint(equalToConstant: 60)
            ])
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 50),
            signInButton.leadingAnchor.constraint(equalTo: passwordText.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: passwordText.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
            ])
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: passwordText.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: passwordText.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 60)
            ])
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
            logoImage.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 60),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            logoImage.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 15),
            logoImage.bottomAnchor.constraint(equalTo: logoView.bottomAnchor, constant: -15)
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
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
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





