//
//  DialogViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 03/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class DialogViewController: UIViewController {

    @IBOutlet weak var labelHeader: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imgDot: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnAction: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func btnCloseAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnActionAction(_ sender: UIButton) {
    }
    
}
