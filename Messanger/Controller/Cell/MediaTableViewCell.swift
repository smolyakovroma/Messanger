//
//  MediaTableViewCell.swift
//  Messanger
//
//  Created by Роман Смоляков on 07/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

   
    @IBOutlet weak var labelSelect: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelSubtext: UILabel!
    @IBOutlet weak var labelDatetime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
