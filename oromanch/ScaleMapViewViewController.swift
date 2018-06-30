//
//  ScaleMapViewViewController.swift
//  oromanch
//
//  Created by Olena ROMANCHENKO on 6/3/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ScaleMapViewViewController: UIViewController, CLLocationManagerDelegate {

    var pin: AnnotationPin!
    var place: Place? = nil
    let manager = CLLocationManager()
    
    @IBOutlet weak var scaleMapSelect: UISegmentedControl!
    @IBOutlet weak var scaleMap: MKMapView!
    @IBAction func geolocation(_ sender: UIButton) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        scaleMap.mapType = .hybrid
        scaleMapSelect.selectedSegmentIndex = 2
        setRegion()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        scaleMap.setRegion(region, animated: true)
        
        self.scaleMap.showsUserLocation = true
        manager.stopUpdatingLocation()
    }
    
    func setRegion() {
        
        if let place = place {
            let coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
            scaleMap.setRegion(region, animated: true)
            pin = AnnotationPin(title: place.title, subtitle: place.subtitle, coordinate: coordinate)
            scaleMap.addAnnotation(pin)
        }
    }
    

    @IBAction func switchCase(_ sender: UISegmentedControl) {
        let index = scaleMapSelect.selectedSegmentIndex
        
        if index == 0 {
            scaleMap.mapType = .standard
        } else if index == 1 {
            scaleMap.mapType = .satellite
        } else {
            scaleMap.mapType = .hybrid
        }
    }
}
