//
//  HistoryVC.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 07/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit
import CoreData

class HistoryVC: UIViewController {
    
    
    @IBOutlet weak var tblview: UITableView!
    
    var Ratings = [RatingHistory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          RetriveData()
      }
    
    
    //MARK:>>>>> FetchData from CoreData
      
      private func RetriveData(){
          let fetchrequest : NSFetchRequest<RatingHistory> = RatingHistory.fetchRequest()
          do{
              let data = try persistenceLayer.context.fetch(fetchrequest)
              self.Ratings = data
            
              self.tblview.reloadData()


          }catch{
              print("catched err in retriving user data fro coredata")
          }
      }
    
    private func SetupUI(){
        self.title = "Rating History"
        tblview.dataSource = self
        tblview.delegate = self
        tblview.tableFooterView = UIView()
    }
    
    deinit {
        print("historyVc removed")
    }

    
}

extension HistoryVC : UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ratings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
        cell.cellview.backgroundColor = UIColor(hexValue: StamuraiColors.ViewTheme)
        cell.cellview.GetblackShadow(myview: cell.cellview, opacity: 0.8, Shadowradius: 1.0)
        print(Ratings[indexPath.row].rating ?? "")
        cell.ratelbl.text = Ratings[indexPath.row].rating ?? ""
        cell.datelbl.text = Ratings[indexPath.row].date ?? ""
        cell.timelbl.text = Ratings[indexPath.row].time ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
         let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

}
