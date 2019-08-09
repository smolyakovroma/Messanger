//
//  SelectDocumentsViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 07/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class SelectDocumentsViewController: UIViewController {

        var docList = [(UIImage(named: "icon_folder"), "Design.pdf", "21.19 MB, 3 Oct 2018 at 0:58", true), (UIImage(named: "icon_folder"), "Art.pdf", "21.19 MB, 3 Oct 2018 at 0:58", true), (UIImage(named: "image_7"), "Photo.jpg", "21.19 MB, 3 Oct 2018 at 0:58", true), (UIImage(named: "icon_pdf_orange"), "Photo.jpg", "21.19 MB, 3 Oct 2018 at 0:58", true), (UIImage(named: "image_8"), "Photo.jpg", "21.19 MB, 3 Oct 2018 at 0:58", true)]
  
    var selectedCounter = 0
    
    @IBOutlet weak var labelSelect: UILabel!
    @IBOutlet weak var viewBottomSelect: UIView!
    
    @IBOutlet weak var viewBottomMenu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnSendSelectAction(_ sender: UIButton) {
    }
    
    @IBAction func btnCloseSelectAction(_ sender: UIButton) {
        
        viewBottomMenu.isHidden = false
        viewBottomSelect.isHidden = true
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        
    }
    

}

extension SelectDocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        cell.imgSelect.isHidden = docList[indexPath.row].3
        cell.labelSelect.isHidden = docList[indexPath.row].3
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell
     
        docList[indexPath.row].3 = !docList[indexPath.row].3
        
        if docList[indexPath.row].3 {
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
        cell.imgSelect.isHidden = docList[indexPath.row].3
        cell.labelSelect.isHidden = docList[indexPath.row].3
//        tableView.reloadData()
        
    }
    
    
    
    
}
