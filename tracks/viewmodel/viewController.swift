//
//  viewController.swift
//  tracks
//
//  Created by Valerio Mosca on 15/03/23.
//

import SwiftUI
import MapKit
import CoreLocation

class ViewController: UIViewController {

    var locManager = CLLocationManager()
    var currentLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        //locManager.allowsBackgroundLocationUpdates = true

        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locManager.location else {
                return
            }
            print("Current Location \(currentLocation.coordinate.latitude)")
            print(currentLocation.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // handle location updates
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // handle location error
    }
}

// da qualche parte va locationManager.delegate = self
// locManager.startUpdatingLocation()
