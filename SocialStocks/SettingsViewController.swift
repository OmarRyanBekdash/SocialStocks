//
//  SettingsViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 12/1/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//



import UIKit

class SettingsViewController: UIViewController {
    
    var privacySwitch: UISwitch!
    
    var privacyLabel: UILabel!
    var privacyDescription: UILabel!
    var profilePicLabel: UILabel!
    var updateLabel: UILabel!
    var updateNameLabel: UILabel!
    var updateUsernameLabel: UILabel!
    var updatePasswordLabel: UILabel!
    var updateEmailLabel: UILabel!
    
    var profilePicLink: UITextField!
    var updateName: UITextField!
    var updateUsername: UITextField!
    var updatePassword: UITextField!
    var confirmPassword: UITextField!
    var updateEmail: UITextField!
    
    var signoutButton: UIButton!
    var updateButton: UIButton!
    var QRButton: UIButton!
    
    var navigationBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationBar = UINavigationBar()
        let navigationItem = UINavigationItem(title: "Settings")
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.isTranslucent = false
        navigationBar.barStyle = .blackOpaque
        navigationBar.tintColor = .gray
        navigationBar.backIndicatorImage = UIImage(named: "BackButtonImage")
        view.addSubview(navigationBar)
        
        profilePicLabel = UILabel()
        profilePicLabel.translatesAutoresizingMaskIntoConstraints = false
        profilePicLabel.text = "Add Profile Picture:"
        profilePicLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        profilePicLabel.textAlignment = .left
        profilePicLabel.textColor = .black
        view.addSubview(profilePicLabel)
        
        profilePicLink = UITextField()
        profilePicLink.translatesAutoresizingMaskIntoConstraints = false
        profilePicLink.text = "Add Picture's URL"
        profilePicLink.font = UIFont.systemFont(ofSize: 16, weight: .light)
        profilePicLink.textAlignment = .left
        profilePicLink.textColor = .gray
        profilePicLink.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(profilePicLink)
        
        updateLabel = UILabel()
        updateLabel.translatesAutoresizingMaskIntoConstraints = false
        updateLabel.text = "Update Personal Information"
        updateLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        updateLabel.textAlignment = .center
        updateLabel.textColor = .black
        view.addSubview(updateLabel)
        
        updateNameLabel = UILabel()
        updateNameLabel.translatesAutoresizingMaskIntoConstraints = false
        updateNameLabel.text = "Name:"
        updateNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        updateNameLabel.textAlignment = .left
        updateNameLabel.textColor = .black
        view.addSubview(updateNameLabel)
        
        updateName = UITextField()
        updateName.translatesAutoresizingMaskIntoConstraints = false
        updateName.text = "Name"
        updateName.font = UIFont.systemFont(ofSize: 16, weight: .light)
        updateName.textAlignment = .left
        updateName.textColor = .gray
        updateName.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(updateName)
        
        updateUsernameLabel = UILabel()
        updateUsernameLabel.translatesAutoresizingMaskIntoConstraints = false
        updateUsernameLabel.text = "Username:"
        updateUsernameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        updateUsernameLabel.textAlignment = .left
        updateUsernameLabel.textColor = .black
        view.addSubview(updateUsernameLabel)
        
        updateUsername = UITextField()
        updateUsername.translatesAutoresizingMaskIntoConstraints = false
        updateUsername.text = User.currentUser?.username
        updateUsername.font = UIFont.systemFont(ofSize: 16, weight: .light)
        updateUsername.textAlignment = .left
        updateUsername.textColor = .gray
        updateUsername.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(updateUsername)
        
        updatePasswordLabel = UILabel()
        updatePasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        updatePasswordLabel.text = "Password:"
        updatePasswordLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        updatePasswordLabel.textAlignment = .left
        updatePasswordLabel.textColor = .black
        view.addSubview(updatePasswordLabel)
        
        updatePassword = UITextField()
        updatePassword.translatesAutoresizingMaskIntoConstraints = false
        updatePassword.text = User.currentUser?.password
        updatePassword.font = UIFont.systemFont(ofSize: 16, weight: .light)
        updatePassword.textAlignment = .left
        updatePassword.textColor = .gray
        updatePassword.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(updatePassword)
        
        confirmPassword = UITextField()
        confirmPassword.translatesAutoresizingMaskIntoConstraints = false
        confirmPassword.text = "Confirm Password:"
        confirmPassword.font = UIFont.systemFont(ofSize: 16, weight: .light)
        confirmPassword.textAlignment = .left
        confirmPassword.textColor = .gray
        confirmPassword.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(confirmPassword)
        
        updateEmailLabel = UILabel()
        updateEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        updateEmailLabel.text = "Email:"
        updateEmailLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        updateEmailLabel.textAlignment = .left
        updateEmailLabel.textColor = .black
        view.addSubview(updateEmailLabel)
        
        updateEmail = UITextField()
        updateEmail.translatesAutoresizingMaskIntoConstraints = false
        updateEmail.text = User.currentUser?.email
        updateEmail.font = UIFont.systemFont(ofSize: 16, weight: .light)
        updateEmail.textAlignment = .left
        updateEmail.textColor = .gray
        updateEmail.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(updateEmail)
        
        privacyLabel = UILabel()
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyLabel.text = "Privacy:"
        privacyLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        privacyLabel.textAlignment = .left
        privacyLabel.textColor = .black
        view.addSubview(privacyLabel)
        
        privacyDescription = UILabel()
        privacyDescription.translatesAutoresizingMaskIntoConstraints = false
        privacyDescription.text = "Off: Everyone can see your current investment posts."
        privacyDescription.font = UIFont.systemFont(ofSize: 16, weight: .light)
        privacyDescription.textAlignment = .left
        privacyDescription.textColor = .gray
        view.addSubview(privacyDescription)
        
        privacySwitch = UISwitch(frame:CGRect(x: 325, y: 750, width: 0, height: 0))
        privacySwitch.addTarget(self, action: #selector(SettingsViewController.switchStateDidChange(_:)), for: .valueChanged)
        privacySwitch.setOn(true, animated: false)
        view.addSubview(privacySwitch)
        
        updateButton = UIButton()
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitle("Update", for: .normal)
        updateButton.backgroundColor = .blue
        updateButton.layer.cornerRadius = 8
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        view.addSubview(updateButton)
        
        signoutButton = UIButton()
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        signoutButton.setTitle("Sign Out", for: .normal)
        signoutButton.backgroundColor = UIColor.init(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        signoutButton.layer.cornerRadius = 8
        //signoutButton.addTarget(self, action: #selector(), for: .touchUpInside)
        view.addSubview(signoutButton)
        
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            profilePicLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            profilePicLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profilePicLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            profilePicLink.topAnchor.constraint(equalTo: profilePicLabel.bottomAnchor, constant: 20),
            profilePicLink.leadingAnchor.constraint(equalTo: profilePicLabel.leadingAnchor),
            profilePicLink.trailingAnchor.constraint(equalTo: profilePicLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateLabel.topAnchor.constraint(equalTo: profilePicLink.bottomAnchor, constant: 20),
            updateLabel.heightAnchor.constraint(equalToConstant: 50),
            updateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            updateNameLabel.topAnchor.constraint(equalTo: updateLabel.bottomAnchor, constant: 20),
            updateNameLabel.leadingAnchor.constraint(equalTo: profilePicLabel.leadingAnchor),
            updateNameLabel.trailingAnchor.constraint(equalTo: profilePicLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateName.topAnchor.constraint(equalTo: updateNameLabel.bottomAnchor, constant: 10),
            updateName.leadingAnchor.constraint(equalTo: profilePicLink.leadingAnchor),
            updateName.trailingAnchor.constraint(equalTo: profilePicLink.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateEmailLabel.topAnchor.constraint(equalTo: updateName.bottomAnchor, constant: 20),
            updateEmailLabel.leadingAnchor.constraint(equalTo: profilePicLabel.leadingAnchor),
            updateEmailLabel.trailingAnchor.constraint(equalTo: profilePicLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateEmail.topAnchor.constraint(equalTo: updateEmailLabel.bottomAnchor, constant: 10),
            updateEmail.leadingAnchor.constraint(equalTo: profilePicLink.leadingAnchor),
            updateEmail.trailingAnchor.constraint(equalTo: profilePicLink.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateUsernameLabel.topAnchor.constraint(equalTo: updateEmail.bottomAnchor, constant: 20),
            updateUsernameLabel.leadingAnchor.constraint(equalTo: profilePicLabel.leadingAnchor),
            updateUsernameLabel.trailingAnchor.constraint(equalTo: profilePicLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateUsername.topAnchor.constraint(equalTo: updateUsernameLabel.bottomAnchor, constant: 10),
            updateUsername.leadingAnchor.constraint(equalTo: profilePicLink.leadingAnchor),
            updateUsername.trailingAnchor.constraint(equalTo: profilePicLink.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updatePasswordLabel.topAnchor.constraint(equalTo: updateUsername.bottomAnchor, constant: 20),
            updatePasswordLabel.leadingAnchor.constraint(equalTo: profilePicLabel.leadingAnchor),
            updatePasswordLabel.trailingAnchor.constraint(equalTo: profilePicLabel.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updatePassword.topAnchor.constraint(equalTo: updatePasswordLabel.bottomAnchor, constant: 10),
            updatePassword.leadingAnchor.constraint(equalTo: profilePicLink.leadingAnchor),
            updatePassword.trailingAnchor.constraint(equalTo: profilePicLink.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            confirmPassword.topAnchor.constraint(equalTo: updatePassword.bottomAnchor, constant: 10),
            confirmPassword.leadingAnchor.constraint(equalTo: profilePicLink.leadingAnchor),
            confirmPassword.trailingAnchor.constraint(equalTo: profilePicLink.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            updateButton.topAnchor.constraint(equalTo: confirmPassword.bottomAnchor, constant: 30),
            updateButton.heightAnchor.constraint(equalToConstant: 30),
            updateButton.widthAnchor.constraint(equalToConstant: 100),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            privacyLabel.topAnchor.constraint(equalTo: updateButton.bottomAnchor, constant: 20),
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200)
            ])
        NSLayoutConstraint.activate([
            privacyDescription.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 10),
            privacyDescription.leadingAnchor.constraint(equalTo: privacyLabel.leadingAnchor),
            privacyDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        NSLayoutConstraint.activate([
            signoutButton.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 50),
            signoutButton.heightAnchor.constraint(equalToConstant: 30),
            signoutButton.widthAnchor.constraint(equalToConstant: 100),
            signoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch!) {
        if (sender.isOn == true){
            privacyDescription.text = "On: Only friends can see your current investment posts."
        }
        else {
            privacyDescription.text = "Off: Everyone can see your current investment posts."
        }
    }
    
    @objc func updateButtonTapped() {
        guard let userId = User.currentUser?.id else { return }
        NetworkManager.getUser(fromUser: userId) { (userSignInResponse) in
            if userSignInResponse.success == true {
                guard let username = userSignInResponse.data?.username else { return }
                guard let password = userSignInResponse.data?.password else { return }
                guard let email = userSignInResponse.data?.email else { return }
                
                NetworkManager.editUser(fromUser: userId, fromEmail: self.updateEmail?.text ?? email, fromUsername: self.updateUsername?.text ?? username, fromPassword: self.updatePassword?.text ?? password, fromConfirmPassword: self.confirmPassword.text!) { (userUpdateResponse) in
                    if self.updatePassword.text! == self.confirmPassword.text! {
                        User.currentUser = userUpdateResponse.data
                        if userUpdateResponse.success == true {
                            //                let viewController = ViewController()
                            self.navigationController?.popViewController(animated: true)
                        } else {
                            let alertController = UIAlertController(title: "Error", message: "One of the fields entered is invalid. Try again.", preferredStyle: .alert)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    } else {
                        let alertController = UIAlertController(title: "Error", message: "\(userUpdateResponse.error!)", preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: "\(userSignInResponse.error!)", preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        //try to fix so that we have the user's username, password, and
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
