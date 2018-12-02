//
//  QRCodeViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 11/30/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import QRCodeReader
import AVFoundation

class AddFriendsViewController: UIViewController {
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    var QRCodeButton: UIButton!
    
    var QRButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        QRCodeButton = UIButton()
        QRCodeButton.translatesAutoresizingMaskIntoConstraints = false
        QRCodeButton.setTitle("Read a QR Code", for: .normal)
        QRCodeButton.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        QRCodeButton.layer.cornerRadius = 8
        QRCodeButton.addTarget(self, action: #selector(QRCodeButtonPushed), for: .touchUpInside)
        view.addSubview(QRCodeButton)
        
        QRButton = UIButton()
        QRButton.translatesAutoresizingMaskIntoConstraints = false
        QRButton.setTitle("Sign Out", for: .normal)
        QRButton.backgroundColor = UIColor.init(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        QRButton.layer.cornerRadius = 8
        QRButton.addTarget(self, action: #selector(QRButtonPressed), for: .touchUpInside)
        view.addSubview(QRButton)
        
        

        // Do any additional setup after loading the view.
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            QRCodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QRCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            QRCodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            QRCodeButton.heightAnchor.constraint(equalToConstant: 60),
            QRCodeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
            ])
        
        NSLayoutConstraint.activate([
            QRButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QRButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            QRButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            QRButton.heightAnchor.constraint(equalToConstant: 60),
            QRButton.topAnchor.constraint(equalTo: QRCodeButton.bottomAnchor, constant: 30)
            ])
        
    }
    
    @objc func QRCodeButtonPushed() {
        readerVC.delegate = self
        navigationController?.pushViewController(readerVC, animated: true)
    }
    
    @objc func QRButtonPressed() {
        navigationController?.pushViewController(QRViewController(), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

extension AddFriendsViewController: QRCodeReaderViewControllerDelegate {
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        self.navigationController?.popViewController(animated: true)
        if let currentUser = User.currentUser, let friendId = Int(result.value) {
            NetworkManager.makeFriend(fromUser: currentUser.id, fromFriend: friendId) { (userSignInResponse) in
                print("a")
            }
        } else {
            print("Failed unwrapping BLAH")
        }
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        self.navigationController?.popViewController(animated: true)
    }
    
}
