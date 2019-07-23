//
//  MapLinkDirectionViewController.swift
//  FlowClu
//
//  Created by Ashish Ashish on 2019-07-05.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit
import MapKit

class MapLinkDirectionViewController: UIViewController {
    
    
    var locationManager = CLLocationManager()
    
    var otherLatitude = ""
    var otherLongitude = ""
    
        var latitude:CLLocationDegrees = 0.0
        var longitude:CLLocationDegrees = 0.0
    

    
    @IBAction func MapDirections(_ sender: Any) {
        
        latitude = Double (otherLatitude)!
        longitude = Double (otherLongitude)!
        
        let regionDistance:CLLocationDistance = 9000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion.init(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        //        mapItem.name = "Oakridge Station"
        mapItem.openInMaps(launchOptions: options)
        
        
        
        
    }
    
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
