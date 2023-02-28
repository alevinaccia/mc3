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
    
    let station : String
    let departTime: Int
    let stationCode : String
    
    init(station : String, departTime : Int, stationCode : String) {
        self.station = station
        self.departTime = departTime
        self.stationCode = stationCode
    }
    
    init(from decoder: Decoder) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.station = try container.decode(String.self, forKey: .stazione)
        self.departTime = (try container.decode(Int.self, forKey : .programmata)/1000)
        self.stationCode = try container.decode(String.self, forKey : .id)
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
