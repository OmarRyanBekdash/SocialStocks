//
//  QRViewController.swift
//  SocialStocks
//
//  Created by William Rockwell Evans on 12/2/18.
//  Copyright © 2018 William Rockwell Evans. All rights reserved.
//

import UIKit
import QRCode

class QRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0/255, green: 39/255, blue: 13/255, alpha: 1.0)
        if let currentUser = User.currentUser {
            let qrCode = QRCode("\(currentUser.id)")
            
            let imageView = UIImageView(image: qrCode?.image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 300),
                imageView.heightAnchor.constraint(equalToConstant: 300)
                ])
        }
        

        // Do any additional setup after loading the view.
        
    }
    
    func addFriend() {
        
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
