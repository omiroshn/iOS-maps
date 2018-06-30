//
//  ViewController.swift
//  oromanch
//
//  Created by Olena ROMANCHENKO on 6/2/18.
//  Copyright © 2018 Olena ROMANCHENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usleep(4500000)
        self.performSegue(withIdentifier: "startSegueToList", sender: self)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

