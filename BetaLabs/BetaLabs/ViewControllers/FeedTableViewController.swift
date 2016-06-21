//
//  FeedTableViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/21/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    private var model:MapViewModel!
    private var reports:[Report] = [Report]()
    override func viewDidLoad() {
        super.viewDidLoad()
        model = MapViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.pinsLoaded), name: "ReportsLoaded", object: nil)
        model.getPins()
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReportsLoaded", object: nil)
    }
    
    func pinsLoaded(notification:NSNotification){
        let pins     = notification.object as! [Report]
        self.reports = pins
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReportTableViewCell", forIndexPath: indexPath) as! ReportTableViewCell
        cell.setReport(reports[indexPath.row])
        return cell
    }
}
