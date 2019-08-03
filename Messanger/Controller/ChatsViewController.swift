//
//  ChatsViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 31/07/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewShop: UIView!
    @IBOutlet weak var viewNews: UIView!
    @IBOutlet weak var viewChats: UIView!
    @IBOutlet weak var viewMusic: UIView!
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var imgChats: UIImageView!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var imgShop: UIImageView!
    @IBOutlet weak var imgMusic: UIImageView!
    @IBOutlet weak var imgMenu: UIImageView!
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnArrowDown: UIButton!
    
    @IBOutlet weak var viewContextMenu: CardView!
    
    @IBOutlet weak var viewSubMenu: CardView!
    let list = [(UIImage(named: "icon_1"), "Ilon Mask", "Hello my friend", "55 min ago", true), (UIImage(named: "icon_1"), "Ilon Mask", "You: Nice)", "11:20", true), (UIImage(named: "icon_2"), "Burton", "Where are you?", "May 22", false), (UIImage(named: "icon_3"), "Ilon Mask", "You: Nice)", "May 22", true), (UIImage(named: "icon_4"), "Mark Zuckerberg", "I do not know where is it how much do it now?", "May 25", true), (UIImage(named: "icon_2"), "Burton", "Where are you?", "May 22", false), (UIImage(named: "icon_3"), "Ilon Mask", "You: Nice)", "May 22", false), (UIImage(named: "icon_4"), "Mark Zuckerberg", "I do not know where is it how much do it now?", "May 25", true), (UIImage(named: "icon_2"), "Burton", "Where are you?", "May 22", true), (UIImage(named: "icon_3"), "Ilon Mask", "You: Nice)", "May 22", false), (UIImage(named: "icon_4"), "Mark Zuckerberg", "I do not know where is it how much do it now?", "May 25", true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        tableView.delegate = self
        tableView.dataSource = self
        setupLongPressGesture()
    }
    
    //настройки экрана
    func initView(){
         self.view.layer.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1).cgColor
        imgShop.alpha = 0.5
         imgNews.alpha = 0.5
         imgMusic.alpha = 0.5
        imgMenu.alpha = 0.5
        
        viewContextMenu.isHidden = true
        viewSubMenu.isHidden = true
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        viewSubMenu.isHidden = true
        viewContextMenu.isHidden = true
    }
    
    @IBAction func btnArrowDownAction(_ sender: UIButton) {
        viewSubMenu.isHidden = false
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        
    }
    
    func setupLongPressGesture() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .ended {
            let touchPoint = gestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                viewContextMenu.frame.origin.y = touchPoint.y
                viewContextMenu.isHidden = false
            }
        }
    }
    
    //Context menu buttons event
    
    @IBAction func btnDisableNotificationsAction(_ sender: UIButton) {
        viewContextMenu.isHidden = true
    }
    
    @IBAction func btnDeleteChatAction(_ sender: UIButton) {
        viewContextMenu.isHidden = true
    }
}


extension ChatsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        cell.labelDateTime.text = list[indexPath.row].3
        cell.imgDot.isHidden = list[indexPath.row].4
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatsTableViewCell
     
    }
    
    // set view for footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 100))
        footerView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        return footerView
    }
    
    // set height for footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    

}
