//
//  ChatViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 01/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    let list = [
        ("Hello", "16:20", nil, false),
        ("Hello) No", "16:20", nil, true),
        ("What you think?", "16:20", UIImage(named: "image_phone"), false),
        ("OMG", "16:21", nil, true),
        ("Are you for real?", "16:21", nil, true),
        ("Hello, bro)", "6:30", nil, false),
        ("How are you?", "6:30", nil, false),
        ("I am fine)", "6:31", nil, true)]
    
    
    @IBOutlet weak var imgUserPic: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserDateTime: UILabel!
    
    @IBOutlet weak var imgVoiceSend: UIImageView!
    @IBOutlet weak var imgAttach: UIImageView!
    @IBOutlet weak var imgSticker: UIImageView!
    @IBOutlet weak var btnSticker: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnVoice: UIButton!
    @IBOutlet weak var btnAttach: UIButton!
    @IBOutlet weak var viewExtraFooter: CardView!
    
    @IBOutlet weak var viewContextMenu: CardView!
    @IBOutlet weak var viewDefaultHeader: UIView!
    @IBOutlet weak var viewEditHeader: UIView!
    
    @IBOutlet weak var heightExtraFooter: NSLayoutConstraint!
    @IBOutlet weak var leadingMessageEdit: NSLayoutConstraint!
    @IBOutlet weak var leadingMessageAttach: NSLayoutConstraint!
    @IBOutlet weak var bottomAnchor: NSLayoutConstraint!
    
    var flShowExtraFooter = false
    

    
    
    @IBOutlet weak var labelExtraText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imgUserPic.layer.masksToBounds = false
        imgUserPic.layer.cornerRadius = imgUserPic.frame.height/3
        imgUserPic.clipsToBounds = true
        
        viewContextMenu.isHidden = true

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        viewContextMenu.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: Edit header buttons
    @IBOutlet weak var btnEHClose: UIButton!
    @IBOutlet weak var labelEH: UILabel!
    @IBOutlet weak var btnEHRetry: UIButton!
    @IBOutlet weak var btnEHEdit: UIButton!
    @IBOutlet weak var btnEHDelete: UIButton!
    @IBOutlet weak var btnEHForward: UIButton!
    
    @IBAction func btnEHCloseAction(_ sender: UIButton) {
        viewEditHeader.isHidden = true
        viewDefaultHeader.isHidden = false
    }
    
    
    @IBAction func btnBackAction(_ sender: UIButton) {
    }
    
    @IBAction func btnMenuAction(_ sender: UIButton) {
        viewContextMenu.isHidden = false
    }
    
    @IBAction func btnVoiceAction(_ sender: UIButton) {
        if flShowExtraFooter {
            UIView.animate(withDuration: 0.3) {
                self.heightExtraFooter.constant = 0
                self.view.setNeedsUpdateConstraints()
                self.view.layoutIfNeeded() // if you call `layoutIfNeeded` on your collectionView, animation doesn't work
                self.flShowExtraFooter = false
                self.tableView.scrollToRow(at: IndexPath.init(item: self.list.count - 1, section: 0), at: .bottom, animated: true)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.heightExtraFooter.constant = -60
                self.view.setNeedsUpdateConstraints()
                self.view.layoutIfNeeded() // if you call `layoutIfNeeded` on your collectionView, animation doesn't work
                self.flShowExtraFooter = true
                
                self.tableView.scrollToRow(at: IndexPath.init(item: self.list.count - 1, section: 0), at: .bottom, animated: true)
            }
            
        }
        
    }
    
    @IBAction func btnAttachAction(_ sender: UIButton) {
    }
    
    
    @IBAction func tfMessageChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func btnStickerAction(_ sender: UIButton) {
        print("sticker press")
    }
    
    @IBAction func tfMessageEditingDidBegin(_ sender: UITextField) {
//        UIView.animate(withDuration: 0.3) {
            self.imgAttach.isHidden = true
            self.imgSticker.isHidden = false
            self.btnSticker.isEnabled = true
            self.leadingMessageEdit.isActive = true
            self.leadingMessageAttach.isActive = false
              self.imgVoiceSend.image = UIImage(named: "icon_send")

//        }
    }
    
    @IBAction func tfMessageEditingDidEnd(_ sender: UITextField) {
//        UIView.animate(withDuration: 0.3) {
            self.imgAttach.isHidden = false
            self.imgSticker.isHidden = true
            self.btnSticker.isEnabled = false
            self.leadingMessageEdit.isActive = false
            self.leadingMessageAttach.isActive = true
            self.imgVoiceSend.image = UIImage(named: "icon_voice_rec")

//        }
    }
    
    @IBAction func btnCloseExtraFooter(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.heightExtraFooter.constant = 0
            self.view.setNeedsUpdateConstraints()
            self.view.layoutIfNeeded() // if you call `layoutIfNeeded` on your collectionView, animation doesn't work
            self.flShowExtraFooter = false
            self.tableView.scrollToRow(at: IndexPath.init(item: self.list.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    //MARK: Context menu buttons action
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        viewDefaultHeader.isHidden = true
        viewEditHeader.isHidden = false
        viewContextMenu.isHidden = true
    }
    
    @IBAction func btnMuteAction(_ sender: UIButton) {
          viewContextMenu.isHidden = true
    }
    
    @IBAction func btnDeleteChatAction(_ sender: UIButton) {
          viewContextMenu.isHidden = true
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        var keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomAnchor.constant = keyboardSize - bottomLayoutGuide.length - 20
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        bottomAnchor.constant = 0
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 80
    //    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatTableViewCell
        cell.selectionStyle = .none
        if list[indexPath.row].3 {
            cell.lAnchor.constant = UIScreen.main.bounds.width / 8
            cell.rAnchor.constant = 20
            cell.viewBox.backgroundColor = UIColor(red: 200.0/255.0, green:
                240.0/255.0, blue: 200.0/255.0, alpha: 1.0)
            cell.viewBox.rightMaskedCorners = true
            //               cell.viewMsg.backgroundColor = .init(red: 200, green: 240, blue: 200, alpha: 1)
        } else {
            cell.lAnchor.constant = 20
            cell.rAnchor.constant = UIScreen.main.bounds.width / 8
            cell.viewBox.backgroundColor = .white
            cell.viewBox.leftMaskedCorners = true
        }
        
        cell.imgAttach.layer.masksToBounds = false
        cell.imgAttach.layer.cornerRadius = cell.viewBox.cornerradius
        cell.imgAttach.clipsToBounds = true
        if list[indexPath.row].2 != nil {
            cell.imgAttach.image = list[indexPath.row].2
        }else{
            cell.imgAttach.isHidden = true
        }
        
        cell.labelMessage.text = list[indexPath.row].0
        cell.labelDateTime.text = list[indexPath.row].1
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChatTableViewCell
        
        
    }
    
    //    // set view for footer
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 100))
    //        footerView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    //        return footerView
    //    }
    
    // set height for footer
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 100
    //    }
}

//cell.selectionStyle = .none
//
//if message.senderId == Constants.id {
//    cell.leftMargin.constant = UIScreen.main.bounds.width / 12
//    cell.rightMargin.constant = 5
//    cell.viewMsg.backgroundColor = UIColor(red: 200.0/255.0, green:
//        240.0/255.0, blue: 200.0/255.0, alpha: 1.0)
//    //               cell.viewMsg.backgroundColor = .init(red: 200, green: 240, blue: 200, alpha: 1)
//}else{
//    cell.leftMargin.constant = 5
//    cell.rightMargin.constant = UIScreen.main.bounds.width / 12
//    cell.viewMsg.backgroundColor = .white
//}
