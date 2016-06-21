//
//  ProfileViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/21/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return 1
        case 1: return 1
        case 2: return 5
        default: return 0
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("HeaderCell", forIndexPath: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("BadgesCell", forIndexPath: indexPath)
            cell.backgroundColor = UIColor.greenColor()
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
            cell.backgroundColor = UIColor.redColor()
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section{
        case 0: return 300
        case 1: return 71
        case 2: return 80
        default: return 0
        }
    }
}
