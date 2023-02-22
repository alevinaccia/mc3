//
//  Trip.swift
//  mc3
//
//  Created by Valerio Mosca on 21/02/23.
//

import Foundation

struct Trip : Identifiable{
    let id: UUID
    let name : String
    let possibleTrips : [TrainStatus]
    let startPoint : String
    let endPoint : String
    //dati mapkit (location, distanza, tempo)
    
    init(id: UUID, name: String, possibleTrips: [TrainStatus], startPoint: String, endPoint: String) {
        self.id = UUID()
        self.name = name
        self.possibleTrips = possibleTrips
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
}
