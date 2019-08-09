//
//  DialogSelectImagesViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 08/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class DialogSelectImagesViewController: UIViewController {

    var list = [(UIImage(named: "image_1"), true), (UIImage(named: "image_4"), true),( UIImage(named: "image_5"), true), (UIImage(named: "image_6"), true),( UIImage(named: "image_0"), true), (UIImage(named: "image_1"), true), (UIImage(named: "image_4"), true), (UIImage(named: "image_5"), true), (UIImage(named: "image_1"), true), (UIImage(named: "image_4"), true),( UIImage(named: "image_5"), true)]
        var selectedCounter = 0
    
    @IBOutlet var viewScreen: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var labelSelect: UILabel!
    @IBOutlet weak var viewBottomSelect: UIView!
    
    @IBOutlet weak var viewBottomMenu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.closeDialog (_:)))
//        viewScreen.addGestureRecognizer(gesture)
    }
    
    @objc func closeDialog(_ sender:UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func btnCloseSectionAction(_ sender: UIButton) {
        viewBottomMenu.isHidden = false
        viewBottomSelect.isHidden = true
    }
    

}

extension DialogSelectImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        cell.image.image = list[indexPath.row].0
        cell.image.layer.masksToBounds = false
        cell.image.layer.cornerRadius = cell.image.frame.height/5
        cell.image.clipsToBounds = true
        if list[indexPath.row].1 {
            cell.imgSelect.image = UIImage(named: "icon_circle")
        } else {
            cell.imgSelect.image = UIImage(named: "icon_select")
        }
        cell.labelSelect.isHidden = list[indexPath.row].1
        return cell
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        list[indexPath.row].1 = !list[indexPath.row].1
        cell.labelSelect.isHidden = list[indexPath.row].1
        if list[indexPath.row].1 {
            cell.imgSelect.image = UIImage(named: "icon_circle")
            cell.heightImageConstraint.constant = 120
            cell.widthImageConstraint.constant = 120
        } else {
            cell.imgSelect.image = UIImage(named: "icon_select")
            cell.heightImageConstraint.constant = 100
            cell.widthImageConstraint.constant = 100
        }
        
        if list[indexPath.row].1 {
            selectedCounter -= 1
        } else {
            selectedCounter += 1
        }
        if selectedCounter > 0 {
            viewBottomSelect.isHidden = false
            viewBottomMenu.isHidden = true
            labelSelect.text = "\(selectedCounter) selected"
        } else {
            viewBottomSelect.isHidden = true
            viewBottomMenu.isHidden = false
        }
    
        
    }

//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
//
//        sectionHeaderView.title = dates[indexPath.section]
//
//        return sectionHeaderView
//
//    }
    
    
}
