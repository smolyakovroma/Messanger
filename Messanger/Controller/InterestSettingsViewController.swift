//
//  InterestSettingsViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 06/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class InterestSettingsViewController: UIViewController {

    @IBOutlet weak var heightAnchorConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectedCollectionView: UICollectionView!
    @IBOutlet weak var tfSearch: UITextField!
    
      var collection = ["People", "Message", "Video", "People"]
     var selectedCollection = ["UI/UX", "UI Search"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tfSearch.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func tfSearchEditingDidEnd(_ sender: Any) {
    }
    
    @IBAction func tfSearchChanged(_ sender: UITextField) {
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        var keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        heightAnchorConstraint.constant = keyboardSize - bottomLayoutGuide.length + 20
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        heightAnchorConstraint.constant = 20
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
}


extension InterestSettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return collection.count
        } else {
            return selectedCollection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TextCollectionViewCell
        
        if collectionView == self.collectionView {
   
            cell.labelText.text = collection[indexPath.row]
        } else {
           
            cell.labelText.text = selectedCollection[indexPath.row]
     
           
        }
        
         return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            selectedCollection.append(collection[indexPath.row])
            collection.remove(at: indexPath.row)
        } else {
            collection.append(selectedCollection[indexPath.row])
            selectedCollection.remove(at: indexPath.row)
        }
        
        self.collectionView.reloadData()
        self.selectedCollectionView.reloadData()
    }
    
    
}
