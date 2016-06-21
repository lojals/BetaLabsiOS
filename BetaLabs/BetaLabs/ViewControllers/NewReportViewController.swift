//
//  NewReportViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/20/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit
import Mapbox
import RSKPlaceholderTextView

class NewReportViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var map: MGLMapView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: RSKPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.translucent  = false
        self.navigationBar.tintColor    = UIColor.whiteColor()
        self.navigationBar.barTintColor = UIColor(red:0.35, green:0.31, blue:0.38, alpha:1.00)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.map.minimumZoomLevel = 15
        let location   = CLLocationCoordinate2D(latitude: 21.16514317984627, longitude: -86.82134628295898)
        self.map.setCenterCoordinate(location, zoomLevel: 16, animated: false)
        self.map.attributionButton.alpha = 0
        self.map.logoView.alpha = 0
        self.map.rotateEnabled = false
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.scrollContainer.contentSize = CGSize(width: self.scrollContainer.frame.width, height: self.map.frame.maxY + 40)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelReport(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
