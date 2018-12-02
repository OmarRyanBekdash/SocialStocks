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
        
        let qrCode = QRCode("\(User.currentUser?.id)")
        qrCode?.image
        
        let imageView = UIImageView(image: qrCode?.image)

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
