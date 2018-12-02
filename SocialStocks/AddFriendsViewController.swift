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
        
    }
    
    @objc func QRCodeButtonPushed() {
        let navViewController = readerVC
        navigationController?.pushViewController(navViewController, animated: true)
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
