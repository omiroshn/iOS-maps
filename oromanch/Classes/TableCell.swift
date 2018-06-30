//
//  TableCell.swift
//  oromanch
//
//  Created by Olena ROMANCHENKO on 6/2/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var tableImageView: UIImageView!
    
    @IBOutlet weak var tableLabelView: UILabel!
    
    func setPlace(place: Place) {
        tableImageView.image = place.image
        tableLabelView.text = place.title
    }

}
