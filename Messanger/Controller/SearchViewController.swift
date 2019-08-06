//
//  SearchViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 04/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let list = [(UIImage(named: "icon_1"), "Ilon Mask", "Designer", "55 min ago", true), (UIImage(named: "icon_1"), "Ilon Mask", "Art designer", "11:20", true), (UIImage(named: "icon_2"), "Burton", "Art designer", "May 22", false), (UIImage(named: "icon_3"), "Ilon Mask", "UX/UI designer", "May 22", true), (UIImage(named: "icon_4"), "Mark Zuckerberg", "Art designer", "May 25", true), (UIImage(named: "icon_2"), "Burton", "Visual designer", "May 22", false), (UIImage(named: "icon_3"), "Ilon Mask", "Art designer", "May 22", false), (UIImage(named: "icon_4"), "Mark Zuckerberg", "UX/UI designer", "May 25", true), (UIImage(named: "icon_2"), "Burton", "Art director", "May 22", true), (UIImage(named: "icon_3"), "Ilon Mask", "UX/UI designer", "May 22", false), (UIImage(named: "icon_4"), "Mark Zuckerberg", "Art designer", "May 25", true)]
    
    
    let collection = [
        ("Jony", UIImage(named: "icon_1")),
        ("Mark", UIImage(named: "icon_2")),
        ("Ilon", UIImage(named: "icon_3")),
        ("Donald", UIImage(named: "icon_4")),
        ("Mark", UIImage(named: "icon_1")),
        ("Ilon", UIImage(named: "icon_3")),
        ("Jony", UIImage(named: "icon_1")),
        ("Mark", UIImage(named: "icon_2")),
        ("Ilon", UIImage(named: "icon_3")),
        ("Donald", UIImage(named: "icon_4")),
        ("Mark", UIImage(named: "icon_1")),
        ("Ilon", UIImage(named: "icon_3")),  ("Mark", UIImage(named: "icon_1")),
        ("Ilon", UIImage(named: "icon_3")),
        ("Jony", UIImage(named: "icon_1")),
        ("Mark", UIImage(named: "icon_2")),
        ("Ilon", UIImage(named: "icon_3")),
        ("Donald", UIImage(named: "icon_4")),
        ("Mark", UIImage(named: "icon_1")),
        ("Ilon", UIImage(named: "icon_3"))]
    
    let textCollection = ["People", "Message", "Video", "People", "Message", "Video", "People", "Message", "Video"]
    
    var selectedTextCell = 0
    
    @IBOutlet weak var imgLeftArrow: UIImageView!
    @IBOutlet weak var viewSearchBox: CardView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var leadingArrowConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var bottomAnchorConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        textCollectionView.delegate = self
        textCollectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "header")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    @IBAction func btnBackPressed(_ sender: UIButton) {
    }
    
    @IBAction func tfSearchEditingDidBegin(_ sender: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.leadingArrowConstraints.isActive = false
            self.leadingConstraints.isActive = true
            sender.backgroundColor = .white
            self.viewSearchBox.backgroundColor = .white
            self.imgLeftArrow.isHidden = true
//            self.view.setNeedsUpdateConstraints()
//            self.view.layoutIfNeeded() // if you call `layoutIfNeeded` on your collectionView, animation doesn't work
        
        }
    }
    
    @IBAction func tfSearchEditingDidEnd(_ sender: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.leadingArrowConstraints.isActive = true
            self.leadingConstraints.isActive = false
            sender.backgroundColor = self.view.backgroundColor
            self.viewSearchBox.backgroundColor = self.view.backgroundColor
            self.imgLeftArrow.isHidden = false
        }
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        var keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomAnchorConstraint.constant = keyboardSize - bottomLayoutGuide.length
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        bottomAnchorConstraint.constant = 0
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return collection.count
        } else {
            return textCollection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SearchCollectionViewCell
            cell.labelUserName.text = collection[indexPath.row].0
            cell.imgUserPic.image = collection[indexPath.row].1
            cell.imgUserPic.layer.masksToBounds = false
            cell.imgUserPic.layer.cornerRadius = cell.imgUserPic.frame.height/3
            cell.imgUserPic.clipsToBounds = true
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TextCollectionViewCell
            cell.labelText.text = textCollection[indexPath.row]
            if (selectedTextCell == indexPath.row){
               cell.labelText.textColor = .black
            } else {
             cell.labelText.textColor = .gray
            }
            return cell
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SearchCollectionViewCell

        } else {
            selectedTextCell = indexPath.row
            textCollectionView.reloadData()

        }
    }
    

}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatsTableViewCell
        
        //        cell.imgUserPic.layer.borderWidth = 1
        cell.imgUserPic.layer.masksToBounds = false
        //        cell.imgUserPic.layer.borderColor = UIColor.black.cgColor
        cell.imgUserPic.layer.cornerRadius = cell.imgUserPic.frame.height/3
        cell.imgUserPic.clipsToBounds = true
        cell.imgUserPic.image = list[indexPath.row].0
        cell.labelUsername.text = list[indexPath.row].1
        cell.labelMessage.text = list[indexPath.row].2
        cell.imgDot.isHidden = list[indexPath.row].4
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatsTableViewCell
        
    }
    

    
    
}
