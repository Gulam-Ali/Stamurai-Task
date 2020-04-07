//
//  RatingVC.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 07/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit
import CoreData

class RatingVC: UIViewController {
    
    //MARK:>>>> IBOutlets
    
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateSlider: UISlider!
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    
    var Range = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         SetupUi()
        print(Range)
    }
    
    private func SetupUi(){
        self.title = "Rating"
        rateView.layer.cornerRadius = 15.0
        rateView.backgroundColor = UIColor(hexValue: StamuraiColors.RatingView)
        rateView.GetblackShadow(myview: rateView, opacity: 0.8, Shadowradius: 1.0)
        submitBtnOtlt.layer.cornerRadius = 12.0
        rateSlider.minimumValue = Float(Range.first ?? 0)
        rateSlider.maximumValue = Float(Range.last ?? 0)
        rateLabel.text = "\(Range.first!)"
    
        setRightBarButton()
    }
    
    
    func setRightBarButton(_ image: UIImage = #imageLiteral(resourceName: "rate9")) {
        self.navigationItem.hidesBackButton = false
        let HistoryBarButton = UIBarButtonItem()
        let HistoryButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        HistoryButton.addTarget(self, action: #selector(HistoryTapped), for: .touchUpInside)
        HistoryButton.setTitle("History", for: .normal)
        HistoryButton.setTitleColor(UIColor.purple, for: .normal)
        HistoryBarButton.customView = HistoryButton
        self.navigationItem.setRightBarButton(HistoryBarButton, animated: true)
    }
    
    private func PersistRatingsData(){
        
        let coredata = RatingHistory(context: persistenceLayer.context)
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd" // HH:mm:ss"
        
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        print(dateString)
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        let timeString = "\(timeFormatter.string(from: Date() as Date))"
        print(timeString)
        
        coredata.date = dateString
        coredata.time = timeString
        coredata.rating = rateLabel.text
        persistenceLayer.saveContext()
        CommonFuncs.AlertWithOK(msg: "Rating done sucessfully", vc: self)
        rateSlider.value = Float(Range.first ?? 0)
        rateLabel.text = "\(Range.first!)"
    }
    
    
    //MARK:>>>> IBActions
    
    @IBAction func SliderAction(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        rateLabel.text = "\(currentValue)"
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        PersistRatingsData()
    }
    
    
    @objc func HistoryTapped(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let move = story.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryVC
        navigationController?.pushViewController(move, animated: true)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
       // Range.removeAll()
    }
    
    deinit {
        print("RatingVC Removed")
    }
    
    
    
}
