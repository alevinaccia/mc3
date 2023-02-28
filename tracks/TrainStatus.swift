//
//  TrainStatus.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 27/02/23.
//

import Foundation

struct TrainStatus: Decodable, Hashable {
    static func == (lhs: TrainStatus, rhs: TrainStatus) -> Bool {
        lhs.trainNumber == rhs.trainNumber
    }
    
    enum CodingKeys: String, CodingKey {
        case origine, destinazione, numeroTreno, ritardo, fermate, compInStazionePartenza
    }
    let departStation : String
    let arrivalStation : String
    let trainNumber : Int
    let delay: Int
    let stops : [Stop]
    let departed : Bool
    var timeAtMyStation : Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.departStation = try container.decode(String.self, forKey: .origine)
        self.arrivalStation = try container.decode(String.self, forKey: .destinazione)
        self.trainNumber = try container.decode(Int.self, forKey: .numeroTreno)
        self.delay = try container.decode(Int.self, forKey: .ritardo)
        self.stops = try container.decode([Stop].self, forKey: .fermate)
        self.departed = try container.decode([String].self, forKey: .compInStazionePartenza).contains(where: {$0 == "Partito"})
        self.timeAtMyStation = 0
    }
    
    init(departStation : String, arrivalStation : String, trainNumber : Int, delay : Int, stops : [Stop], departed : Bool, time : Int) {
        self.departStation = departStation
        self.arrivalStation = arrivalStation
        self.trainNumber = trainNumber
        self.delay = delay
        self.stops = stops
        self.departed = departed
        self.timeAtMyStation = time
    }
    
    mutating func setTime(station : String){
        for stop in self.stops {
            if stop.stationCode == station {
                self.timeAtMyStation = stop.departTime
                break
            }
        }
    }
    func hash(into hasher: inout Hasher) {
       hasher.combine(trainNumber)
     }
}
