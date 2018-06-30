//
//  Place.swift
//  oromanch
//
//  Created by Oleksii MIROSHNYK on 6/2/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import Foundation
import UIKit

class Place {
    var image: UIImage
    var title: String
    var subtitle: String
    var latitude: Double
    var longitude: Double
    
    init(image: UIImage, title: String, subtitle: String, latitude: Double, longitude: Double) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
