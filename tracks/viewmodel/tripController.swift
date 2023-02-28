//
//  tripController.swift
//  mc3
//
//  Created by Valerio Mosca on 27/02/23.
//

import Foundation

class TripViewModel: ObservableObject{
    
    @Published var userTrips: [Trip] = []
    
    func addTrip(tripIn: Trip){
        print("ciao")
    }
}
