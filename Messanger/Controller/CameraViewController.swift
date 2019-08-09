//
//  CameraViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 08/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var viewVideo: UIView!
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBOutlet weak var imgRightIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPhotoAction(_ sender: UIButton) {
        viewPhoto.isHidden = true
        viewVideo.isHidden = false
    }
    
    @IBAction func btnVideoAction(_ sender: UIButton) {
        viewPhoto.isHidden = false
        viewVideo.isHidden = true
    }
}

