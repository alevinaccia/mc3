//
//  Trip.swift
//  tracks
//
//  Created by Alessandro Vinaccia on 27/02/23.
//

import Foundation
//
//  Trip.swift
//  mc3
//
//  Created by Valerio Mosca on 21/02/23.
//

import Foundation


struct Trip : Identifiable{
    let id: UUID
    var name : String
    let possibleTrains : [TrainStatus]
    let startPoint : Station
    let endPoint : Station
    var nextArrivals : [String] = []
    //dati mapkit (location, distanza, tempo)
    
    init(id: UUID, name: String, possibleTrains: [TrainStatus], startPoint: Station, endPoint: Station){
        self.id = UUID()
        self.name = name
        self.possibleTrains = possibleTrains
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    mutating func updateTrips(){
        //update delays
        self.nextArrivals = []
        for train in possibleTrains {
            let now = Date().timeIntervalSince1970/1000
            self.nextArrivals.append(String((train.timeAtMyStation - Int(now))/60))
        }
        //get new trips
        //remove old ones
    }
}
