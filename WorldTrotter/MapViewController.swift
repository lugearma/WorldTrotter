//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Luis Arias on 01/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        self.mapView = MKMapView()
        self.locationManager = CLLocationManager()
//        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        self.view = mapView
        
        
        addSegmentControl()
        addButtonToLocalizeUser()
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
        
//            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func addButtonToLocalizeUser() {
        let button = UIButton()
        button.setTitle("User", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0)
        
        button.addTarget(self, action:#selector(buttonTapped) , forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    func buttonTapped() {
        self.mapView.showsUserLocation = true
    }
    
    func addSegmentControl() {
        let segmentControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentControl)
        
        let topConstrain = segmentControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        
        let margins = self.view.layoutMarginsGuide
        let leadingContrain = segmentControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingContrain = segmentControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstrain.active = true
        leadingContrain.active = true
        trailingContrain.active = true
        
        segmentControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged), forControlEvents: .ValueChanged)
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        var mapRegion = MKCoordinateRegion()
        mapRegion.center = mapView.userLocation.coordinate
        print("Latitude: \(mapView.userLocation.coordinate.latitude)")
        print("Logitud: \(mapView.userLocation.coordinate.longitude)")
        mapRegion.span.latitudeDelta = 0.2
        mapRegion.span.longitudeDelta = 0.2
        
        mapView.regionThatFits(mapRegion)
        
        mapView.setRegion(mapRegion, animated: true)
    }
}






