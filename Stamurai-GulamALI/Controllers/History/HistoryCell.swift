//
//  HistoryCell.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 07/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var ratelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
