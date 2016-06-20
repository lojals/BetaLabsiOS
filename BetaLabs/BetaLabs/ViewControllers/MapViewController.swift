//
//  MapViewController.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/20/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController, MGLMapViewDelegate {
    @IBOutlet weak var map: MGLMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.logoView.alpha = 0
        map.attributionButton.alpha = 0
        
        
        
        let location2 = CLLocationCoordinate2D(latitude: 21.16514317984627, longitude: -86.82134628295898)    
        let ann2        = MGLPointAnnotation()
        ann2.coordinate = location2
        map.addAnnotation(ann2)
    }
    
    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        print("lo logra/???")
        
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
    
}
