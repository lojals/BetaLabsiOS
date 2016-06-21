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
    @IBOutlet weak var map: MGLMapView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var openedMenu:Bool = false {didSet{self.animateMenu()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.logoView.alpha = 0
        map.attributionButton.alpha = 0
        
        let location   = CLLocationCoordinate2D(latitude: 21.16514317984627, longitude: -86.82134628295898)
        let ann2        = MGLPointAnnotation()
        ann2.coordinate = location
        map.addAnnotation(ann2)
        
        map.showsUserLocation = true
    }
    
    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        var annotationImage = mapView.dequeueReusableAnnotationImageWithIdentifier("pisa")
        if annotationImage == nil {
            var image = UIImage(named: "pin")!
            image = image.imageWithAlignmentRectInsets(UIEdgeInsetsMake(0, 0, image.size.height/2, 0))
            annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: "pisa")
        }
        return annotationImage
    }
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func mapView(mapView: MGLMapView, didSelectAnnotation annotation: MGLAnnotation) {
        map.setCenterCoordinate(annotation.coordinate, animated: true)
        openedMenu = !openedMenu
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
        }else{
            value = -128
        }
        let animation     = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
        animation.toValue = value
        bottomConstraint.pop_addAnimation(animation, forKey: "AnimateMenu")
    }
}
