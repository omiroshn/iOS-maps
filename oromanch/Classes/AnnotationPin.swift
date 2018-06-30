//
//  AnnotationPin.swift
//  oromanch
//
//  Created by Oleksii MIROSHNYK on 6/3/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import MapKit

class AnnotationPin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
