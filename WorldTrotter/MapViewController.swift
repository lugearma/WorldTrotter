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
        
        let segmentControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentControl)
        
        let topConstrain = segmentControl.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        let leadingContrain = segmentControl.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor)
        let trailingContrain = segmentControl.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor)
        
        topConstrain.active = true
        leadingContrain.active = true
        trailingContrain.active = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map view controller loaded its view")
    }
    
}
