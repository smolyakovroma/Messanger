//
//  ChangeNumberViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 05/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class ChangeNumberViewController: UIViewController {

     @IBOutlet weak var labelHeader: UILabel!
    
    //views for pin
    @IBOutlet weak var viewPin: UIView!
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var viewPin1: CardView!
    @IBOutlet weak var viewPin2: CardView!
    @IBOutlet weak var viewPin3: CardView!
    @IBOutlet weak var viewPin4: CardView!
    
    @IBOutlet weak var tfPin1: UITextField!
 
       @IBOutlet weak var tfPin2: UITextField!
       @IBOutlet weak var tfPin3: UITextField!
       @IBOutlet weak var tfPin4: UITextField!
    //views changenumber
    @IBOutlet weak var viewNumber: UIView!
    
    @IBOutlet weak var tfNumber: UITextField!
    
    @IBOutlet weak var heightAnchorConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelSubtext: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelHeader.text = "Enter the code"
        
        tfPin1.addTarget(self, action: #selector(self.textFieldDidChanged(textField:)), for: .editingChanged)
        tfPin2.addTarget(self, action: #selector(self.textFieldDidChanged(textField:)), for: .editingChanged)
        tfPin3.addTarget(self, action: #selector(self.textFieldDidChanged(textField:)), for: .editingChanged)
        tfPin4.addTarget(self, action: #selector(self.textFieldDidChanged(textField:)), for: .editingChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tfPin1.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func textFieldDidChanged(textField: UITextField) {
        let text = textField.text
        
        if text?.utf16.count == 1 {
            switch textField {
            case tfPin1:
                self.viewPin1.backgroundColor = UIColor(red:27/255, green:63/255, blue:255/255, alpha: 1)
                tfPin2.becomeFirstResponder()
            case tfPin2:
                  self.viewPin2.backgroundColor = UIColor(red:27/255, green:63/255, blue:255/255, alpha: 1)
                tfPin3.becomeFirstResponder()
            case tfPin3:
                  self.viewPin3.backgroundColor = UIColor(red:27/255, green:63/255, blue:255/255, alpha: 1)
                tfPin4.becomeFirstResponder()
            case tfPin4:
                self.viewPin4.backgroundColor = UIColor(red:27/255, green:63/255, blue:255/255, alpha: 1)
                tfPin4.resignFirstResponder()
                labelError.isHidden = false
            default:
                break
            }
        } else {
            
        }
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
        heightAnchorConstraint.constant = 50
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
    }
    
    @IBAction func btnCheckAction(_ sender: UIButton) {
        if !tfPin4.text!.isEmpty {
            viewPin.isHidden = true
            viewNumber.isHidden = false
        }
    }
}
