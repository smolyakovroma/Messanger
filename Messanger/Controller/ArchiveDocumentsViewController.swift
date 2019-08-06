//
//  ArchiveDocumentViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 06/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ArchiveDocumentsViewController: UIViewController {
    
    let imagesList = [UIImage(named: "image_1"), UIImage(named: "image_2"), UIImage(named: "image_3"), UIImage(named: "image_0")]
    let videosList = [UIImage(named: "image_4"), UIImage(named: "image_5"), UIImage(named: "image_6"), UIImage(named: "image_0")]
    let musicList = [(UIImage(named: "image_7"), "Music title 1", "Author 1", "3:56"), (UIImage(named: "image_8"), "Music title 2", "Author 2", "2:48")]
    let docList = [(UIImage(named: "doc_1"), "Design.pdf", "21.19 MB, 3 Oct 2018 at 0:58"), (UIImage(named: "doc_2"), "Art.pdf", "21.19 MB, 3 Oct 2018 at 0:58"), (UIImage(named: "image_7"), "Photo.jpg", "21.19 MB, 3 Oct 2018 at 0:58")]
    
    @IBOutlet weak var imgUserPic: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelUserDatetime: UILabel!
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var musicTableView: UITableView!
    @IBOutlet weak var documentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgUserPic.layer.masksToBounds = false
        imgUserPic.layer.cornerRadius = imgUserPic.frame.height/3
        imgUserPic.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnMenuAction(_ sender: UIButton) {
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        var keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        //        heightAnchorConstraint.constant = keyboardSize - bottomLayoutGuide.length + 20
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        //        heightAnchorConstraint.constant = 20
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
}


extension ArchiveDocumentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.imagesCollectionView {
            return imagesList.count
        } else {
            return videosList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        
        if collectionView == self.imagesCollectionView {
            cell.image.image = imagesList[indexPath.row]
            if indexPath.row + 1 == imagesList.count {
                cell.label.text = "+10"
            }
        } else {
            cell.image.image = videosList[indexPath.row]
            if indexPath.row + 1 == videosList.count {
                cell.label.text = "+2"
            }
        }
        cell.image.layer.masksToBounds = false
        cell.image.layer.cornerRadius =  cell.image.frame.height/5
        cell.image.clipsToBounds = true
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        if collectionView == self.collectionView {
        //            selectedCollection.append(collection[indexPath.row])
        //            collection.remove(at: indexPath.row)
        //        } else {
        //            collection.append(selectedCollection[indexPath.row])
        //            selectedCollection.remove(at: indexPath.row)
        //        }
        //
        //        self.collectionView.reloadData()
        //        self.selectedCollectionView.reloadData()
    }
    
    
}


extension ArchiveDocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.musicTableView {
            return 90
        } else {
            return 70
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.musicTableView {
            return musicList.count
        } else {
            return docList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MediaTableViewCell
        
        cell.img.layer.masksToBounds = false
        cell.img.layer.cornerRadius = cell.img.frame.height/5
        cell.img.clipsToBounds = true
        if tableView == self.musicTableView {
            cell.img.image = musicList[indexPath.row].0
            cell.labelText.text = musicList[indexPath.row].1
            cell.labelSubtext.text = musicList[indexPath.row].2
            cell.labelDatetime.text = musicList[indexPath.row].3
        } else {
            cell.img.image = docList[indexPath.row].0
            cell.labelText.text = docList[indexPath.row].1
            cell.labelSubtext.text = docList[indexPath.row].2
            
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MediaTableViewCell
        
    }
    
    
    
    
}
