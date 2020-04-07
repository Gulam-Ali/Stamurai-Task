//
//  CommonFuncs.swift
//
//  Created by gulam ali on 07/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit
import AVFoundation

class CommonFuncs: NSObject {

    //MARK:>>> Alert with ok btn to dismiss
    class func AlertWithOK(msg:String,vc:UIViewController){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
    }
    
 
}
