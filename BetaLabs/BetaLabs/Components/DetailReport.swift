//
//  DetailReport.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/21/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit
import Haneke

class DetailReport: UIView {
    var imgReport:UIImageView!
    var lblTitle:UILabel!
    var lblAddress:UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        
        imgReport = UIImageView()
        imgReport.backgroundColor = UIColor(red:0.82, green:0.25, blue:0.37, alpha:1.00)
        imgReport.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imgReport)
        
        lblTitle = UILabel()
        lblTitle.text = "Reporte de bache"
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.font = UIFont.boldSystemFontOfSize(16)
        lblTitle.sizeToFit()
        self.addSubview(lblTitle)
        
        lblAddress               = UILabel()
        lblAddress.text          = "SM 35 MZA 12 L 1, Cancún,  Quintana Roo. Mexico CP. 77500"
        lblAddress.numberOfLines = 2
        lblAddress.translatesAutoresizingMaskIntoConstraints = false
        lblAddress.font = UIFont.systemFontOfSize(15)
        self.addSubview(lblAddress)
        
        
        
        
        let views = ["i":imgReport,"t":lblTitle,"a":lblAddress]
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[i(130)]-10-[t]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-140-[a]-10-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[i]|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-18-[t][a]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views))
        self.addConstraint(NSLayoutConstraint(item: self.lblAddress, attribute: .Left, relatedBy: .Equal, toItem: self.lblTitle, attribute: .Left, multiplier: 1, constant: 0))
    }
    
    func load(){
        //        imgReport.hnk_setImageFromURL(NSURL(string: "http://theexpiredmeter.com/wp-content/uploads/2008/12/pothole.jpg"))
    }
    
    func setReport(report:Report){
        lblTitle.text         = report.title
        imgReport.image       = UIImage(data: report.image!)
        imgReport.contentMode = .ScaleAspectFill
        imgReport.layer.masksToBounds = true
    }
    
}
