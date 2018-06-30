//
//  MapView.swift
//  oromanch
//
//  Created by Olena ROMANCHENKO on 6/2/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var pin: AnnotationPin!
    let manager = CLLocationManager()
    
    @IBOutlet weak var segmentionMenu: UISegmentedControl!
    @IBOutlet weak var mapRender: MKMapView!
    @IBAction func geolocation(_ sender: UIButton) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        mapRender.delegate = self
        mapRender.mapType = .hybrid
        segmentionMenu.selectedSegmentIndex = 2
        
        let coordinate = CLLocationCoordinate2D(latitude: 50.4688426, longitude: 30.4619423)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        mapRender.setRegion(region, animated: true)
        pin = AnnotationPin(title: "Unit Factory", subtitle: "Ukrainian Programming school", coordinate: coordinate)
        mapRender.addAnnotation(pin)
    }
    
    @IBAction func switchCase(_ sender: UISegmentedControl) {
        let index = segmentionMenu.selectedSegmentIndex
        
        if index == 0 {
            mapRender.mapType = .standard
        } else if index == 1 {
            mapRender.mapType = .satellite
        } else {
            mapRender.mapType = .hybrid
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapRender.setRegion(region, animated: true)
        
        self.mapRender.showsUserLocation = true
        manager.stopUpdatingLocation()
    }
    
    /*
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "UnitFactoryPin")
        annotationView.image = UIImage(named: "pin")
        let transform = CGAffineTransform(scaleX: 0.09, y: 0.09)
        annotationView.transform = transform
        return annotationView
    }
    */
}
