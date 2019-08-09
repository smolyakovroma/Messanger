//
//  ImageCollectionViewCell.swift
//  Messanger
//
//  Created by Роман Смоляков on 06/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var labelSelect: UILabel!
    
    @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var widthImageConstraint: NSLayoutConstraint!
}
