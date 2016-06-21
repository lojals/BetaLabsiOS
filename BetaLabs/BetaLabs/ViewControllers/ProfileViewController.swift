//
//  ProfileViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/21/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var imgUser2: UIImageView!
    
    @IBOutlet weak var lblName1: UILabel!
    @IBOutlet weak var lblName2: UILabel!
    
    @IBOutlet weak var lblCounter1: UILabel!
    @IBOutlet weak var lblCounter2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight         = UITableViewAutomaticDimension
        self.tableView.allowsSelection   = false
        
        self.imgUser.layer.cornerRadius  = 32
        self.imgUser1.layer.cornerRadius = 27.5
        self.imgUser2.layer.cornerRadius = 27.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
}
