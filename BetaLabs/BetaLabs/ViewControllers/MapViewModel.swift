//
//  MapViewModel.swift
//  BetaLabs
//
//  Created by Jorge Raul Ovalle Zuleta on 6/20/16.
//  Copyright © 2016 betalabs. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class MapViewModel{
    private let managedObjectContext:NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func getPins(){
        let fetchRequest = NSFetchRequest(entityName: "Report")
        do{
            let fetchResults = try managedObjectContext.executeRequest(fetchRequest) as! NSAsynchronousFetchResult
            let fetchBuilding    = fetchResults.finalResult as! [Report]
            NSNotificationCenter.defaultCenter().postNotificationName("ReportsLoaded", object: fetchBuilding)    
        }catch{
            
        }
    }
    
    func saveReport(title:String, category:String, lat:Double, long:Double, img1:NSData, img2:NSData){
        let rep       = NSEntityDescription.insertNewObjectForEntityForName("Report", inManagedObjectContext: managedObjectContext) as! Report
        rep.title     = title
        rep.category  = category
        rep.latitude  = lat
        rep.longitude = long
        rep.image     = img1
        rep.image2    = img2
        
        do{
            try managedObjectContext.save()
        }catch{
            print("Some error saving the report")
        }
    }
}
