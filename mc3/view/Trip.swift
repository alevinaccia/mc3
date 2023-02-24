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
    let possibleTrips : [TrainStatus]
    let startPoint : String
    let endPoint : String
    var nextArrivals : [String] = []
    //dati mapkit (location, distanza, tempo)
    
    init(id: UUID, name: String, possibleTrips: [TrainStatus], startPoint: String, endPoint: String){
        self.id = UUID()
        self.name = name
        self.possibleTrips = possibleTrips
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    mutating func updateTrips(){
        //update delays
        self.nextArrivals = []
        for train in possibleTrips {
            let now = Date().timeIntervalSince1970/1000
            self.nextArrivals.append(String((train.timeAtMyStation - Int(now))/60))
        }
        //get new trips
        //remove old ones
    }
}
