//
//  ViewController.swift
//  Memorable Places
//
//  Created by Krishna Sai on 12/31/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var pin:String = ""
    var markedPlaces = Set<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if pin != "" {
            print(pin)
            CLGeocoder().geocodeAddressString(pin) { (placemarks, error) -> Void in
                if error != nil {
                    print(error)
                } else {
                    if placemarks?.count > 0 {
                        let mark = placemarks![0];
                        let lat = mark.location!.coordinate.latitude;
                        let lon = mark.location!.coordinate.longitude;
                        print(lat, lon)
                    
                        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lon)
                    
                        let latDelta:CLLocationDegrees = 0.05
                        let lonDelta:CLLocationDegrees = 0.05
                    
                        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
                        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
                        self.map.setRegion(region, animated: true)
                    
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        annotation.title = self.pin
                        self.map.addAnnotation(annotation)
                    }
                }
            }
            pin = ""
        }
		
		let uilpgr = UILongPressGestureRecognizer(target: self, action: "mark:")
		uilpgr.minimumPressDuration = 1
		map.addGestureRecognizer(uilpgr)
    }
	
    func mark(gestureRecognizer: UIGestureRecognizer) {
		
        let touchPoint = gestureRecognizer.locationInView(self.map)
		
        let newCoordinates:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
		
		CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: newCoordinates.latitude, longitude: newCoordinates.longitude), completionHandler: {(placemarks, error) -> Void in
			if (error != nil) {
				print(error)
			} else {
				if placemarks!.count > 0 {
					let pl = CLPlacemark(placemark: placemarks![0])
					self.markedPlaces.insert(pl.name!)
					
					let annotation = MKPointAnnotation()
					annotation.coordinate = newCoordinates
					annotation.title = pl.name!
					self.map.addAnnotation(annotation)
				}
			}
		})
		if let temp = NSUserDefaults.standardUserDefaults().objectForKey("markedPlaces") {
			for t in (temp as! String).componentsSeparatedByString(",") {
					markedPlaces.insert(t)
			}
		}
		markedPlaces.remove("")
		let saveObject = markedPlaces.joinWithSeparator(",")
		NSUserDefaults.standardUserDefaults().setObject(saveObject, forKey: "markedPlaces")
		print(saveObject)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

