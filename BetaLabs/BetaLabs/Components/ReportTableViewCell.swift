//
//  ReportTableViewCell.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/21/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit

class ReportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgReport: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgReport.layer.cornerRadius  = 27.5
        imgReport.layer.masksToBounds = true
        
        lblTime.text    = "2:44"
        lblTitle.text   = "Bache increible"
        lblAddress.text = "SM 38 MZA 42 L 3 Cancún, Quintana Roo CP 77500"
        lblAddress.sizeToFit()
        imgReport.hnk_setImageFromURL(NSURL(string: "http://theexpiredmeter.com/wp-content/uploads/2008/12/pothole.jpg"))
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
