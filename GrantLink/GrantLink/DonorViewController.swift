//
//  DonorViewController.swift
//  GrantLink
//
//  Created by Ayaan Haque on 4/24/20.
//  Copyright © 2020 Ayaan Haque. All rights reserved.
//

import UIKit
import MapKit

class DonorViewController: UIViewController {

    @IBOutlet weak var mapViewController: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkLocationServices()
        }
        func checkLocationServices() {
          if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
          } else {
            // Show alert letting the user know they have to turn this on.
          }
        }
        func checkLocationAuthorization() {
          switch CLLocationManager.authorizationStatus() {
          case .authorizedWhenInUse:
            mapViewController.showsUserLocation = true
            let latitude = Double(mapViewController.userLocation.location?.coordinate.latitude ?? 0)
            let longitude = Double(mapViewController.userLocation.location?.coordinate.longitude ?? 0)
           case .denied: // Show alert telling users how to turn on permissions
           break
          case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapViewController.showsUserLocation = true
          case .restricted: // Show an alert letting them know what’s up
           break
          case .authorizedAlways:
           break
            };




    }
    
    
    @IBAction func showUsersPressed(_ sender: Any) {
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: 37.257468, longitude:-122.030720)
        annotation.coordinate = centerCoordinate
        annotation.title = "Sajiv Shah"
        annotation.subtitle = "Hi! Would really appreciate a donation"
        mapViewController.addAnnotation(annotation)
        
        let annotation2 = MKPointAnnotation()
        let centerCoordinate2 = CLLocationCoordinate2D(latitude: 37.256802, longitude:-122.029400)
        annotation2.coordinate = centerCoordinate2
        annotation2.title = "Adithya Peruvemba"
        annotation2.subtitle = "Hi! My family really needs money to eat."
        mapViewController.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        let centerCoordinate3 = CLLocationCoordinate2D(latitude: 37.254599, longitude:-122.026535)
        annotation3.coordinate = centerCoordinate3
        annotation3.title = "Vignav Ramesh"
        annotation3.subtitle = "Hello! I want to save for a car!"
        mapViewController.addAnnotation(annotation3)
        
        let annotation4 = MKPointAnnotation()
        let centerCoordinate4 = CLLocationCoordinate2D(latitude: Double(mapViewController.userLocation.location?.coordinate.latitude ?? 0), longitude:Double(mapViewController.userLocation.location?.coordinate.longitude ?? 0))
        annotation4.coordinate = centerCoordinate4
        annotation4.title = "Ayaan Haque"
        annotation4.subtitle = "Hello, needs money to buy a meal"
        mapViewController.addAnnotation(annotation4)
        
    }
    @IBAction func accountPressed(_ sender: Any) {
        
        
        
    }
    
    @IBAction func donatePressed(_ sender: Any) {
    }
    

}
