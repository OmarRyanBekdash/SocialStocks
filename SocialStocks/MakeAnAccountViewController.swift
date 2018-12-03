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
    
    var signupLabel: UILabel!
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
        
        
        signupLabel = UILabel()
        signupLabel.translatesAutoresizingMaskIntoConstraints = false
        signupLabel.text = "Sign Up"
        signupLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        signupLabel.textAlignment = .center
        signupLabel.textColor = .black
        view.addSubview(signupLabel)
        
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Enter Name"
        nameTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        nameTextField.textAlignment = .left
        nameTextField.textColor = .black
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(nameTextField)
        
        let nameIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        let nameIcon = UIImage(named: "username-icon.png")
        nameIconView.image = nameIcon
        nameTextField.leftViewMode = UITextField.ViewMode.always
        nameTextField.leftView = nameIconView
        view.addSubview(nameIconView)
        
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        emailLabel.textAlignment = .left
        emailLabel.textColor = .black
        view.addSubview(emailLabel)
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Enter email"
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        emailTextField.textAlignment = .left
        emailTextField.textColor = .black
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(emailTextField)
        
        let emailIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        let emailIcon = UIImage(named: "email-icon.png")
        emailIconView.image = emailIcon
        emailTextField.leftViewMode = UITextField.ViewMode.always
        emailTextField.leftView = emailIconView
        view.addSubview(emailIconView)
        
        
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username"
        usernameLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        usernameLabel.textAlignment = .left
        usernameLabel.textColor = .black
        view.addSubview(usernameLabel)
        
        usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Enter Username"
        usernameTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        usernameTextField.textAlignment = .left
        usernameTextField.textColor = .black
        usernameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(usernameTextField)
        
        let usernameIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        usernameIconView.image = nameIcon
        usernameTextField.leftViewMode = UITextField.ViewMode.always
        usernameTextField.leftView = usernameIconView
        view.addSubview(usernameIconView)
        
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .black
        view.addSubview(passwordLabel)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        passwordTextField.textAlignment = .left
        passwordTextField.textColor = .black
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(passwordTextField)
        
        let passwordIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        let passwordIcon = UIImage(named: "password-icon.png")
        passwordIconView.image = passwordIcon
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.leftView = passwordIconView
        view.addSubview(passwordIconView)
        
        
        confirmPasswordLabel = UILabel()
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        confirmPasswordLabel.textAlignment = .left
        confirmPasswordLabel.textColor = .black
        view.addSubview(confirmPasswordLabel)
        
        confirmPasswordTextField = UITextField()
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.placeholder = "Re-enter Password"
        confirmPasswordTextField.font = UIFont.systemFont(ofSize: 16, weight: .light)
        confirmPasswordTextField.textAlignment = .left
        confirmPasswordTextField.textColor = .black
        confirmPasswordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(confirmPasswordTextField)
        
        let confirmPasswordIconView = UIImageView(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        confirmPasswordIconView.image = passwordIcon
        confirmPasswordTextField.leftViewMode = UITextField.ViewMode.always
        confirmPasswordTextField.leftView = confirmPasswordIconView
        view.addSubview(confirmPasswordIconView)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        signUpButton.layer.cornerRadius = 8
        //    TODO    signUpButton.addTarget(self, action: #selector(), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        
        
        
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            signupLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            signupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: signupLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: signupLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            usernameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 75),
            signUpButton.heightAnchor.constraint(equalToConstant: 30),
            signUpButton.widthAnchor.constraint(equalToConstant: 100),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
    }
    
    
    
    
    
    @objc func signUpButtonClicked() {
        NetworkManager.userSignUp(fromUsername: usernameTextField.text!, fromPassword: passwordTextField.text!, fromEmail: emailTextField.text!, fromConfirmPassword: confirmPasswordTextField.text!) { (userSignInResponse) in
            if self.passwordTextField!.text == self.confirmPasswordTextField!.text {
                User.currentUser = userSignInResponse.data
                if userSignInResponse.success == true {
                    let viewController = ViewController()
                    self.navigationController?.pushViewController(viewController, animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "One of the fields entered is invalid. Try again.", preferredStyle: .alert)
                    self.present(alertController, animated: true, completion: nil)
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: "Passwords do not match. Try again.", preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
//            User.currentUser = userSignInResponse.data
//            if userSignInResponse.success == true {
//                let viewController = ViewController()
//                self.navigationController?.pushViewController(viewController, animated: true)
//            } else {
//                let alertController = UIAlertController(title: "Error", message: "One of the fields entered is invalid. Try again.", preferredStyle: .alert)
//                self.present(alertController, animated: true, completion: nil)
//            }
            
        }
    }
}


//import UIKit
//import SnapKit
//
//class MakeAnAccountViewController: UIViewController {
//
//    var nameLabel: UILabel!
//    var usernameLabel: UILabel!
//    var emailLabel: UILabel!
//    var passwordLabel: UILabel!
//    var confirmPasswordLabel: UILabel!
//
//    var nameTextField: UITextField!
//    var usernameTextField: UITextField!
//    var emailTextField: UITextField!
//    var passwordTextField: UITextField!
//    var confirmPasswordTextField: UITextField!
//
//    var signUpButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        nameLabel = UILabel()
//        nameLabel.text = "Full Name"
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.font = UIFont.systemFont(ofSize: 16)
//        nameLabel.textAlignment = .left
//        nameLabel.textColor = .black
//        view.addSubview(nameLabel)
//
//        usernameLabel = UILabel()
//        usernameLabel.text = "Username"
//        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
//        usernameLabel.font = UIFont.systemFont(ofSize: 16)
//        usernameLabel.textAlignment = .left
//        usernameLabel.textColor = .black
//        view.addSubview(usernameLabel)
//
//        emailLabel = UILabel()
//        emailLabel.text = "Email"
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        emailLabel.font = UIFont.systemFont(ofSize: 16)
//        emailLabel.textAlignment = .left
//        emailLabel.textColor = .black
//        view.addSubview(emailLabel)
//
//        passwordLabel = UILabel()
//        passwordLabel.text = "Password"
//        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
//        passwordLabel.font = UIFont.systemFont(ofSize: 16)
//        passwordLabel.textAlignment = .left
//        passwordLabel.textColor = .black
//        view.addSubview(passwordLabel)
//
//        confirmPasswordLabel = UILabel()
//        confirmPasswordLabel.text = "Confirm Password"
//        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
//        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 16)
//        confirmPasswordLabel.textAlignment = .left
//        confirmPasswordLabel.textColor = .black
//        view.addSubview(confirmPasswordLabel)
//
//        nameTextField = UITextField()
//        nameTextField.placeholder = "Enter Name"
//        nameTextField.textColor = .black
//        nameTextField.font = UIFont.systemFont(ofSize: 16)
//        nameTextField.borderStyle = .roundedRect
//        nameTextField.textAlignment = .left
//        nameTextField.translatesAutoresizingMaskIntoConstraints = false
//        nameTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
//        nameTextField.delegate = self
//        view.addSubview(nameTextField)
//
//        usernameTextField = UITextField()
//        usernameTextField.placeholder = "Enter Username"
//        usernameTextField.textColor = .black
//        usernameTextField.font = UIFont.systemFont(ofSize: 16)
//        usernameTextField.borderStyle = .roundedRect
//        usernameTextField.textAlignment = .left
//        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
//        usernameTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
//        usernameTextField.delegate = self
//        view.addSubview(usernameTextField)
//
//        emailTextField = UITextField()
//        emailTextField.placeholder = "Enter Email"
//        emailTextField.textColor = .black
//        emailTextField.font = UIFont.systemFont(ofSize: 16)
//        emailTextField.borderStyle = .roundedRect
//        emailTextField.textAlignment = .left
//        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        emailTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
//        emailTextField.delegate = self
//        view.addSubview(emailTextField)
//
//        passwordTextField = UITextField()
//        passwordTextField.placeholder = "Enter Password"
//        passwordTextField.textColor = .black
//        passwordTextField.font = UIFont.systemFont(ofSize: 16)
//        passwordTextField.borderStyle = .roundedRect
//        passwordTextField.textAlignment = .left
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        passwordTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
//        passwordTextField.delegate = self
//        view.addSubview(passwordTextField)
//
//        confirmPasswordTextField = UITextField()
//        confirmPasswordTextField.placeholder = "Confirm Password"
//        confirmPasswordTextField.textColor = .black
//        confirmPasswordTextField.font = UIFont.systemFont(ofSize: 16)
//        confirmPasswordTextField.borderStyle = .roundedRect
//        confirmPasswordTextField.textAlignment = .left
//        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
//        confirmPasswordTextField.clearButtonMode = UITextField.ViewMode.unlessEditing
//        confirmPasswordTextField.delegate = self
//        view.addSubview(confirmPasswordTextField)
//
//        signUpButton = UIButton()
//        signUpButton.translatesAutoresizingMaskIntoConstraints = false
//        signUpButton.setTitle("Sign Up", for: .normal)
//        signUpButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
//        signUpButton.layer.cornerRadius = 8
//        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
//        view.addSubview(signUpButton)
//
//
//
//        setUpConstraints()
//        // Do any additional setup after loading the view.
//    }
//
//    func setUpConstraints() {
//        //20
//        NSLayoutConstraint.activate([
//            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 17),
//            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            nameLabel.heightAnchor.constraint(equalToConstant: 16)
//            ])
//
//        NSLayoutConstraint.activate([
//            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
//            nameTextField.heightAnchor.constraint(equalToConstant: 25),
//            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            usernameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
//            usernameLabel.heightAnchor.constraint(equalToConstant: 16)
//            ])
//
//        NSLayoutConstraint.activate([
//            usernameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
//            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
//            usernameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
//            usernameTextField.heightAnchor.constraint(equalToConstant: 25)
//            ])
//
//        NSLayoutConstraint.activate([
//            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
//            emailLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
//            emailLabel.heightAnchor.constraint(equalToConstant: 16)
//            ])
//
//        NSLayoutConstraint.activate([
//            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
//            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
//            emailTextField.heightAnchor.constraint(equalToConstant: 25),
//            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
//            ])
//
//        NSLayoutConstraint.activate([
//            passwordLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            passwordLabel.heightAnchor.constraint(equalToConstant: 16),
//            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
//            passwordLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 25),
//            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10)
//            ])
//
//        NSLayoutConstraint.activate([
//            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
//            confirmPasswordLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            confirmPasswordLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
//            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 16)
//            ])
//
//        NSLayoutConstraint.activate([
//            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10),
//            confirmPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
//            confirmPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
//            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 25)
//            ])
//
//        NSLayoutConstraint.activate([
//            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            signUpButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
//            signUpButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
//            signUpButton.heightAnchor.constraint(equalToConstant: 60),
//            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 20)
//            ])
//
//    }
//
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//
//
//    @objc func signUpButtonClicked() {
//        NetworkManager.userSignUp(fromUsername: usernameTextField.text!, fromPassword: passwordTextField.text!, fromEmail: emailTextField.text!, fromConfirmPassword: confirmPasswordTextField.text!) { (userSignInResponse) in
//            if self.passwordTextField.text! == self.confirmPasswordTextField.text! {
//                User.currentUser = userSignInResponse.data
//                if userSignInResponse.success == true {
//                    //                let viewController = ViewController()
//                    self.navigationController?.popViewController(animated: true)
//                } else {
//                    let alertController = UIAlertController(title: "Error", message: "One of the fields entered is invalid. Try again.", preferredStyle: .alert)
//                    self.present(alertController, animated: true, completion: nil)
//                }
//            } else {
//                let alertController = UIAlertController(title: "Error", message: "\(userSignInResponse.error!)", preferredStyle: .alert)
//                self.present(alertController, animated: true, completion: nil)
//            }
//
//        }
//    }
//}
//
//extension MakeAnAccountViewController: UITextFieldDelegate{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return true
//    }
//
//}
