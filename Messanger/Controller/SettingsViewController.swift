//
//  SettingsViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 05/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let list = ["Designer", "Architecture", "Photo", "Video", "Bisnese"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgUserPic: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelNumber: UILabel!
    
    @IBOutlet weak var labelAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgUserPic.layer.masksToBounds = false
        imgUserPic.layer.cornerRadius = imgUserPic.frame.height/3
        imgUserPic.clipsToBounds = true
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnLogoutAction(_ sender: UIButton) {
    }
    
}


extension SettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TextCollectionViewCell
            cell.labelText.text = list[indexPath.row]
    
            return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    }
    
    
}
