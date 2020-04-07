//
//  ViewController.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 07/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK:>>>>> IBOutlets
    
    @IBOutlet weak var maximumlbl: UILabel!
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var ratingBtnOTLT: UIButton!
    @IBOutlet weak var minimumlbl: UILabel!
    
    
    //MARK:>>>>> Objects
    
    let LimitRange = ["0","1","2","3","4","5","6","7","8","9"]
    
    var Preference = ""
    
    var SelectedRange = [Int]()
    
    var MinimumRange = 0
    var MaximumRange = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUi()
    }
    
   
    
    
    private func SetupUi(){
        
        self.title = "Home"

        ratingBtnOTLT.setTitle("Rating", for: .normal)
        
        view1.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)
        view2.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)
        
        view1.layer.cornerRadius = 10.0
        view2.layer.cornerRadius = 10.0
        
        view1.GetblackShadow(myview: view1, opacity: 0.5, Shadowradius: 1.0)
        view2.GetblackShadow(myview: view2, opacity: 0.5, Shadowradius: 1.0)
        
        ratingBtnOTLT.layer.cornerRadius = 12.0
        
        pickerview.isHidden = true
        pickerview.delegate = self
        
    }
    
    

    
    //MARK:>>>> IBAction
    
    @IBAction func HandleSelections(_ sender: Any) {
        
        switch ((sender as AnyObject).tag) {
        case 10:
            print("View1 tapped")
            Preference = "min"
            view1.backgroundColor = UIColor(hexValue: StamuraiColors.SelectedView)
            view2.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)

            pickerview.isHidden = false
            
        case 20:
            print("View2 tapped")
            Preference = "max"
            view1.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)
            view2.backgroundColor = UIColor(hexValue: StamuraiColors.SelectedView)
            pickerview.isHidden = false
            
        default:
            break
        }
        
    }
    
    
    
    @IBAction func RatingTapped(_ sender: Any) {
        print("Rating tapped")
        CheckRanges()
    }
    
    
    private func CheckRanges(){
        
        if MinimumRange == MaximumRange{
            CommonFuncs.AlertWithOK(msg: "Cannot have same range,maximum range value should be greater then minimum range", vc: self)
        }else if MaximumRange < MinimumRange{
              CommonFuncs.AlertWithOK(msg: "Maximum range should be greater then minimum range", vc: self)
        }else if MinimumRange > MaximumRange{
            //
             CommonFuncs.AlertWithOK(msg: "Minimum range should be less then maximum range", vc: self)
        }else{
            // navigate
             let story = UIStoryboard(name: "Main", bundle: nil)
             let move = story.instantiateViewController(withIdentifier: "RatingVC") as! RatingVC
            SelectedRange.append(MinimumRange)
            SelectedRange.append(MaximumRange)
            
             move.Range = SelectedRange
            pickerview.isHidden = true
            view1.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)
            view2.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)
             navigationController?.pushViewController(move, animated: true)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SelectedRange.removeAll()
    }
    
    


}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return LimitRange.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return LimitRange[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if Preference == "min"{
            minimumlbl.text = LimitRange[row]
            MinimumRange = Int(LimitRange[row])!
        }else{
            maximumlbl.text = LimitRange[row]
            MaximumRange = Int(LimitRange[row])!
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 25)
        
        label.text = LimitRange[row]
        
        return label
    }
}


