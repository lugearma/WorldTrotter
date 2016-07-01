//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Luis Arias on 01/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        self.mapView = MKMapView()
        self.view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map view controller loaded its view")
    }
    
}
