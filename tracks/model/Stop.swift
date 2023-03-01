//
//  Stop.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 27/02/23.
//

import Foundation

struct Stop: Decodable {
    enum CodingKeys: String, CodingKey {
        case stazione, programmata, id
    }
    
    let station : Station
    let departTime: Int
    
    init(station : Station, departTime : Int) {
        self.station = station
        self.departTime = departTime
    }
    
    init(from decoder: Decoder) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.station = Station(name: try container.decode(String.self, forKey: .stazione), code: try container.decode(String.self, forKey : .id))
        self.departTime = (try container.decode(Int.self, forKey : .programmata)/1000)
    }
}

struct testStruct : Decodable {
    enum CodingKeys: String, CodingKey {
        case numeroTreno, destinazione
    }
    var trainCode : String
    let destination : String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trainCode = String(try container.decode(Int.self, forKey: .numeroTreno))
        self.destination = try container.decode(String.self, forKey: .destinazione)
    }
}
