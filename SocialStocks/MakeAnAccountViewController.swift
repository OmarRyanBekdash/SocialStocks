//
//  MakeAnAccountViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 12/1/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import SnapKit

class MakeAnAccountViewController: UIViewController {
    
    var nameLabel: UILabel!
    var usernameLabel: UILabel!
    var emailLabel: UILabel!
    var passwordLabel: UILabel!
    var confirmPasswordLabel: UILabel!
    
    var nameTextField: UITextField!
    var usernameTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var confirmPasswordTextField: UITextField!
    
    var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel = UILabel()
        nameLabel.text = "Full Name"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textAlignment = .right
        nameLabel.textColor = .black
        
        usernameLabel = UILabel()
        usernameLabel.text = "Username"
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.font = UIFont.systemFont(ofSize: 15)
        usernameLabel.textAlignment = .right
        usernameLabel.textColor = .black
        
        passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.font = UIFont.systemFont(ofSize: 15)
        passwordLabel.textAlignment = .right
        passwordLabel.textColor = .black
        
        confirmPasswordLabel = UILabel()
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 15)
        confirmPasswordLabel.textAlignment = .right
        confirmPasswordLabel.textColor = .black
        
        nameTextField = UITextField()
        nameTextField.placeholder = "Enter Name"
        nameTextField.textColor = .black
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = .roundedRect
        nameTextField.textAlignment = .right
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
        
        usernameTextField = UITextField()
        usernameTextField.placeholder = "Enter Username"
        usernameTextField.textColor = .black
        usernameTextField.font = UIFont.systemFont(ofSize: 15)
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.textAlignment = .right
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Enter Email"
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.borderStyle = .roundedRect
        emailTextField.textAlignment = .right
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textAlignment = .right
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
        
        confirmPasswordTextField = UITextField()
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.textColor = .black
        confirmPasswordTextField.font = UIFont.systemFont(ofSize: 15)
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.textAlignment = .right
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor.init(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        signUpButton.layer.cornerRadius = 8
        //        signUpButton.addTarget(self, action: #selector(), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        setUpContraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            ])
        
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
