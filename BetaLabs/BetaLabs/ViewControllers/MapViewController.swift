//
//  MapViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/20/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit
import Mapbox
import pop

class MapViewController: UIViewController, MGLMapViewDelegate {
    @IBOutlet weak var detailReport: DetailReport!
    @IBOutlet weak var map: MGLMapView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    private var model:MapViewModel!
    private var reports:[Report]!
    
    private var selectedReport:Report!
    
    var openedMenu:Bool = false {didSet{self.animateMenu()}}
    let location   = CLLocationCoordinate2D(latitude: 21.16514317984627, longitude: -86.82134628295898)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.logoView.alpha          = 0
        map.attributionButton.alpha = 0
        map.rotateEnabled           = false
        map.showsUserLocation       = true
        model = MapViewModel()
    }
    
    func pinsLoaded(notification:NSNotification){
        let pins     = notification.object as! [Report]
        self.reports = pins
        for (i,p) in pins.enumerate(){
            let ann2        = MGLPointAnnotation()
            ann2.coordinate = CLLocationCoordinate2D(latitude: Double(p.latitude!), longitude: Double(p.longitude!))
            ann2.title      = "\(i)"
            ann2.subtitle   = p.category
            map.addAnnotation(ann2)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.map.minimumZoomLevel = 10
        self.map.setCenterCoordinate(location, zoomLevel: 12, animated: false)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.pinsLoaded), name: "ReportsLoaded", object: nil)
        
        model.getPins()
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReportsLoaded", object: nil)
    }
    
    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        if let im = annotation.subtitle{
            var annotationImage = mapView.dequeueReusableAnnotationImageWithIdentifier(im!)
            if annotationImage == nil {
                var image = UIImage(named: im!)!
                image = image.imageWithAlignmentRectInsets(UIEdgeInsetsMake(0, 0, image.size.height/2, 0))
                annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: im!)
            }
            return annotationImage
        }else{
            return nil
        }
    }
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func mapView(mapView: MGLMapView, didSelectAnnotation annotation: MGLAnnotation) {
        map.setCenterCoordinate(annotation.coordinate, animated: true)
        selectedReport = reports[Int(annotation.title!!)!]
        detailReport.setReport(selectedReport)
        openedMenu     = true
    }
    
    func mapView(mapView: MGLMapView, regionDidChangeAnimated animated: Bool) {
        if !animated{
            openedMenu = false
        }
    }
    
    private func animateMenu(){
        var value = 0
        if openedMenu{
            value = 0
            detailReport.load()
        }else{
            value = -100
        }
        let animation     = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        animation.toValue = value
        bottomConstraint.pop_addAnimation(animation, forKey: "AnimateMenu")
    }
}
