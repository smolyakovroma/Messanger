//
//  DialogSelectDocumentsViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 08/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class DialogSelectDocumentsViewController: UIViewController {

    var docList = [(UIImage(named: "icon_archive"), "Internal Storage", "Free 382.87 MB of 11.57 GB"), (UIImage(named: "icon_music"), "Music", "Send audio and music files"), (UIImage(named: "icon_download"), "Downloads", "8 files")]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewScreen: UIView!
    @IBOutlet weak var viewFooter: CardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.closeDialog (_:)))
        viewScreen.addGestureRecognizer(gesture)
        
    }
    
    @objc func closeDialog(_ sender:UITapGestureRecognizer){
         dismiss(animated: true, completion: nil)
    }


}


extension DialogSelectDocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MediaTableViewCell
        cell.selectionStyle = .none
        cell.img.layer.masksToBounds = false
        cell.img.layer.cornerRadius = cell.img.frame.height/5
        cell.img.clipsToBounds = true
        cell.img.image = docList[indexPath.row].0
        cell.labelText.text = docList[indexPath.row].1
        cell.labelSubtext.text = docList[indexPath.row].2
        return cell
    }
    
    

    
    
    
}
