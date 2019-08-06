//
//  EditUsernameViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 05/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class EditUsernameViewController: UIViewController {

    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var imgCheckUsername: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelError.isHidden = true
    }
    

    @IBAction func btnBackPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnCheckAction(_ sender: UIButton) {
         labelError.isHidden = false
    }
    
}
