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
import DKImagePickerController

class NewReportViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var scrollContainer: UIScrollView!
    @IBOutlet weak var map: MGLMapView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.translucent  = false
        self.navigationBar.tintColor    = UIColor.whiteColor()
        self.navigationBar.barTintColor = UIColor(red:0.35, green:0.31, blue:0.38, alpha:1.00)
        
        self.txtTitle.tintColor         = UIColor(red:0.82, green:0.25, blue:0.37, alpha:1.00)
        self.txtTitle.delegate          = self
        self.txtCategory.tintColor      = UIColor(red:0.82, green:0.25, blue:0.37, alpha:1.00)
        self.txtCategory.delegate       = self
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
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func AddPicture(sender: AnyObject) {
        let pickerController = DKImagePickerController()
        pickerController.singleSelect = true
        pickerController.assetType = .AllPhotos
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            assets[0].fetchFullScreenImage(true, completeBlock: {[unowned self] (image, info) in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    (self.view.viewWithTag(sender.tag) as! UIButton).setImage(image, forState: .Normal)
                    (self.view.viewWithTag(sender.tag) as! UIButton).imageView?.contentMode = .ScaleAspectFill
                })
                })
        }
        self.presentViewController(pickerController, animated: true) {}
    }
    
    @IBAction func PostReport(sender: AnyObject) {
        self.view.endEditing(true)
        let alert = BadgeAlert(frame: self.view.bounds)
        alert.delegate = self
        self.view.addSubview(alert)
        alert.showAlert()
    }
}

extension NewReportViewController:BadgeAlertDelegate{
    func didClose() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


extension NewReportViewController:UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
