//
//  Trip.swift
//  mc3
//
//  Created by Valerio Mosca on 21/02/23.
//

import Foundation

struct Trip : Identifiable, Hashable{
    static func ==(lhs: Trip, rhs : Trip)-> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: UUID
    var name : String
    var possibleTrains : [TrainStatus]
    let startPoint : Station
    let endPoint : Station
    var nextArrivals : [String] = []
    //dati mapkit (location, distanza, tempo)
    
    init(id: UUID, name: String, possibleTrips: [TrainStatus], startPoint: Station, endPoint: Station){
        self.id = UUID()
        self.name = name
        self.possibleTrains = possibleTrips
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    mutating func updateTrips() async{
        //update delays
        do {
            self.nextArrivals = []
            self.possibleTrains = try await ApiController.shared.getPossibleTrains(from: startPoint.code, to: endPoint.code)
            for train in possibleTrains {
                let now = Date().timeIntervalSince1970/1000
                self.nextArrivals.append(String((train.timeAtMyStation - Int(now))/60))
            }
        } catch {
            print(error)
        }
        //get new trips
        //remove old ones
    }
}
