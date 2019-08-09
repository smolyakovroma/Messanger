//
//  PhotoEditViewController.swift
//  Messanger
//
//  Created by Роман Смоляков on 08/08/2019.
//  Copyright © 2019 Роман Смоляков. All rights reserved.
//

import UIKit

class PhotoEditViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let colors: [UIColor] = [.red, .blue, .gray, .green, .yellow, .cyan, .black, .magenta, .orange, .red, .blue, .gray, .green, .yellow, .cyan, .black, .magenta, .orange]
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var viewMain: UIView!
    
    @IBOutlet weak var viewFilter: UIView!
    
    @IBOutlet weak var viewHeader: CardView!
    
    @IBOutlet weak var viewEditFooter: CardView!
    @IBOutlet weak var viewColorsFooter: UIView!
    @IBOutlet weak var viewEditHeader: CardView!
    
    @IBOutlet weak var viewDegreesSelect: UIView!
    @IBOutlet weak var labelDegree: UILabel!
    @IBOutlet weak var pickerDegrees: UIPickerView!
    @IBOutlet weak var imgIconTurn: UIImageView!
    @IBOutlet weak var btnTurn: UIButton!
    
    //sliders
    @IBOutlet weak var viewFiltersSelect: UIView!
    
    @IBOutlet weak var labelExposure: UILabel!
    @IBOutlet weak var labelContrast: UILabel!
    @IBOutlet weak var labelWarmth: UILabel!
    @IBOutlet weak var labelSaturation: UILabel!
    @IBOutlet weak var sliderExposure: UISlider!
    @IBOutlet weak var sliderContrast: UISlider!
    @IBOutlet weak var sliderWarmth: UISlider!
    @IBOutlet weak var sliderSaturation: UISlider!
    

    
    
    let pickerData = [0,1,2,3,4,5,6,7,8,9]
    var rotationAngle: CGFloat!
    
    let degree_symbol = "°"
    override func viewDidLoad() {
        super.viewDidLoad()
        rotationAngle = -90 * (.pi / 180)
        labelDegree.text = "0\(degree_symbol)"
        
        
    }
    
    override func viewDidLayoutSubviews() {
        let y = pickerDegrees.frame.origin.y
        pickerDegrees.transform = CGAffineTransform(rotationAngle: rotationAngle)
        pickerDegrees.frame = CGRect(x: -100 , y: y, width: view.frame.width + 135, height: 60)
        pickerDegrees.subviews[1].isHidden = true
        pickerDegrees.subviews[2].isHidden = true
        
        sliderExposure.setThumbImage(UIImage(named: "thumb")!, for: .normal)
        sliderContrast.setThumbImage(UIImage(named: "thumb")!, for: .normal)
        sliderWarmth.setThumbImage(UIImage(named: "thumb")!, for: .normal)
        sliderSaturation.setThumbImage(UIImage(named: "thumb")!, for: .normal)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let img = UIImageView()
        img.image = UIImage(named: "line")
        img.frame =  CGRect(x: 0, y: 0, width: 40, height: 2)
        return img
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelDegree.text = "\(pickerData[row])\(degree_symbol)"
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(pickerData[row])
    }
    
    @IBAction func btnTurnAction(_ sender: UIButton) {
        print("turn pressed!")
    }
    
    @IBAction func btnDoneAction(_ sender: UIButton) {
        viewDegreesSelect.isHidden = false
        btnTurn.isEnabled = true
        imgIconTurn.isHidden = false
        viewFiltersSelect.isHidden = true
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        viewDegreesSelect.isHidden = true
        btnTurn.isEnabled = false
        imgIconTurn.isHidden = true
        viewFiltersSelect.isHidden = false
    }
    
    @IBAction func btnBackPressedFilter(_ sender: UIButton) {
        viewFilter.isHidden = true
        viewMain.isHidden = false
    }
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        viewHeader.isHidden = true
        viewEditHeader.isHidden = false
        viewEditFooter.isHidden = true
        viewColorsFooter.isHidden = false
    }
    
    @IBAction func btnBackPressedEdit(_ sender: UIButton) {
        viewHeader.isHidden = false
        viewEditHeader.isHidden = true
        viewEditFooter.isHidden = false
        viewColorsFooter.isHidden = true
    }
    
    @IBAction func btnResizeAction(_ sender: UIButton) {
        viewFilter.isHidden = false
        viewMain.isHidden = true
        viewDegreesSelect.isHidden = false
        btnTurn.isEnabled = true
        imgIconTurn.isHidden = false
        viewFiltersSelect.isHidden = true
    }
    
    @IBAction func btnBrushAction(_ sender: UIButton) {
        viewHeader.isHidden = true
        viewEditHeader.isHidden = false
        viewEditFooter.isHidden = true
        viewColorsFooter.isHidden = false
    }
    
    @IBAction func btnFilterAction(_ sender: UIButton) {
        viewFilter.isHidden = false
        viewMain.isHidden = true
        viewDegreesSelect.isHidden = true
        btnTurn.isEnabled = false
        imgIconTurn.isHidden = true
        viewFiltersSelect.isHidden = false
    }
    
    //sliders change
    @IBAction func sliderExposureChanged(_ sender: UISlider) {
        labelExposure.text = "\(Int(sender.value.rounded()))"
    }
    @IBAction func sliderContrastChanged(_ sender: UISlider) {
         labelContrast.text = "\(Int(sender.value.rounded()))"
    }
    
    @IBAction func sliderWarmthChanged(_ sender: UISlider) {
         labelWarmth.text = "\(Int(sender.value.rounded()))"
    }
    
    @IBAction func sliderSaturationChanged(_ sender: UISlider) {
         labelSaturation.text = "\(Int(sender.value.rounded()))"
    }
}



extension PhotoEditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        cell.viewColor.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        cell.viewColor.backgroundColor = colors[indexPath.row]
        return cell
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
}
