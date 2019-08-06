//
//  ArchiveImagesViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 06/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ArchiveImagesViewController: UIViewController {

    let list = [UIImage(named: "image_1"), UIImage(named: "image_4"), UIImage(named: "image_5"), UIImage(named: "image_6"), UIImage(named: "image_0")]
    
    let dates = ["Today", "Yesterday", "May 21", "May 18"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        
    }
    
}

extension ArchiveImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return list.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
            cell.image.image = list[indexPath.row]
            cell.image.layer.masksToBounds = false
            cell.image.layer.cornerRadius = cell.image.frame.height/5
            cell.image.clipsToBounds = true
            return cell

    }
    
  
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        
        sectionHeaderView.title = dates[indexPath.section]
       
        return sectionHeaderView
        
    }

   
}
