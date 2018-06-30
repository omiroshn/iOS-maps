//
//  ListViewController.swift
//  oromanch
//
//  Created by Olena ROMANCHENKO on 6/2/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        places = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func createArray() -> [Place] {
        var tempPlaces: [Place] = []
        
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "UNIT"), title: "UNIT Factory", subtitle: "Ukrainian Programming school", latitude: 50.4688426, longitude: 30.4619423))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Ecole42"), title: "Ecole 42", subtitle: "French Programming school", latitude: 48.8965488, longitude: 2.3162668))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "sillicon"), title: "Silicon Valley", subtitle: "Home of Steeve Jobs", latitude: 37.402473, longitude: -122.3212843))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Taj_Mahal"), title: "Taj Mahal", subtitle: "The legendary mausoleum in the style of the Mongols", latitude: 27.1750151, longitude: 78.0399612))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Tour_Eiffel"), title: "Tour Eiffel", subtitle: "A tower of the 19th century with a height of 324 meters", latitude: 48.8580948, longitude: 2.2934835))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Big_Ben"), title: "Big Ben", subtitle: "Famous London watch", latitude: 51.5007292, longitude: -0.1268194))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Temple_Bar"), title: "Temple Bar", subtitle: "Famous Irish pub", latitude: 53.3455349, longitude: -6.2676304))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Sagrada_Familia"), title: "Sagrada Familia", subtitle: "Gaudí´s temple in Barcelona", latitude: 36.7434461, longitude: -4.4256192))
        tempPlaces.append(Place(image: #imageLiteral(resourceName: "Niagara_Falls"), title: "Niagara Falls", subtitle: "Legedary waterfall", latitude: 43.0828162, longitude: -79.0763516))

        return tempPlaces
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        
        cell.setPlace(place: place)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "1000", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "1000" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let selectedRow = indexPath.row
                if let destination = segue.destination as? ScaleMapViewViewController {
                    destination.place = self.places[selectedRow]
                }
            }
        }
    }
}
