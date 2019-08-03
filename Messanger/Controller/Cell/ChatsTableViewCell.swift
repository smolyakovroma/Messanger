//
//  ChatsTableViewCell.swift
//  Messanger
//
//  Created by Роман Смоляков on 31/07/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgUserPic: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    
    @IBOutlet weak var imgDot: UIImageView!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelDateTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
