//
//  ChatTableViewCell.swift
//  Messanger
//
//  Created by Роман Смоляков on 01/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAttach: UIImageView!
    @IBOutlet weak var viewBox: CardView!
    @IBOutlet weak var rAnchor: NSLayoutConstraint!
    @IBOutlet weak var lAnchor: NSLayoutConstraint!
    @IBOutlet weak var labelDateTime: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
