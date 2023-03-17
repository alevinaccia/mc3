//
//  viewController.swift
//  tracks
//
//  Created by Valerio Mosca on 15/03/23.
//

import SwiftUI
import MapKit
import CoreLocation


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8517746, longitude: 14.2681244), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var locationManager: CLLocationManager?
    
    
    func initLocation(){
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager!.startUpdatingLocation()
    }
    
    func checkIfLocationServicesIsEnabled() -> Bool{
        if CLLocationManager.locationServicesEnabled(){
            return true
        }else{
            print("Show an alert letting them know this is off and to go turn it on.")
            return false
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func getUserLocation() -> Coordinates{
        let userCoord = Coordinates(lat: locationManager?.location?.coordinate.latitude ?? 0,
                                    lon: locationManager?.location?.coordinate.longitude ?? 0)
        return userCoord
    }
}


// da qualche parte va locationManager.delegate = self
// locManager.startUpdatingLocation()
