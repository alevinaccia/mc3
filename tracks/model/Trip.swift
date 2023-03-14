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
    let coordinatesStartingPoint: Coordinates
    var nextArrivals : [String] = ["-","-"]
    var iconName : String = ""
    //dati mapkit (location, distanza, tempo)
    
    init(id: UUID, name: String, startPoint: Station, endPoint: Station, icon : String, coordinatesStartingPoint : Coordinates){
        self.id = id
        self.name = name
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.possibleTrains = []
        self.iconName = icon
        self.coordinatesStartingPoint = coordinatesStartingPoint
    }
    
    init(){
        self.id = UUID()
        self.name = ""
        self.possibleTrains = []
        self.startPoint = Station()
        self.endPoint = Station()
        self.coordinatesStartingPoint = Coordinates()
    }

    mutating func updateTrips() async{
        //update delays
        do {
            self.nextArrivals = []
            self.possibleTrains = try await ApiController.shared.getPossibleTrains(from: startPoint.code, to: endPoint.code)
            for train in possibleTrains {
                let now = Date().timeIntervalSince1970
                self.nextArrivals.append(String(Int(Double(train.timeAtMyStation) - now)/60))
            }
        } catch {
            print(error)
        }
    }
    
    func toDictionary()->[String:String]{
        var dict = [String:String]()
        dict["name"] = self.name
        dict["first"] = self.nextArrivals[0]
        dict["second"] = self.nextArrivals[1]
        dict["icon"] = self.iconName
        return dict
    }
}

extension Trip {
    static func placeholder() -> Trip{
        Trip(id: UUID(), name: "Test", startPoint: Station(name: "Test", code: "Test"), endPoint: Station(name: "Test", code: "Test"), icon: "home", coordinatesStartingPoint: Coordinates(lat: 0, lon: 0))
    }
}
