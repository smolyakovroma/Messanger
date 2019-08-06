//
//  SectionHeaderView.swift
//  Messanger
//
//  Created by Роман Смоляков on 07/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var label: UILabel!
    
    var title: String! {
        didSet {
            label.text = title
        }
    }
}
