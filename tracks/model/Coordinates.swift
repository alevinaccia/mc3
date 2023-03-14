//
//  Coordinates.swift
//  tracks
//
//  Created by Valerio Mosca on 13/03/23.
//

import Foundation

struct Coordinates: Codable {
    var lat: Double
    var lon: Double
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    enum CodingKeys: String, CodingKey {
        case lat, lon
    }
    init() {
        self.lat = 0
        self.lon = 0
    }
//    init(from decoder: Decoder) throws{
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.lat = try container.decode(Double.self, forKey: .lat)
//        self.lon = try container.decode(Double.self, forKey: .lon)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(lat, forKey: .lat)
//        try container.encode(lon, forKey: .lon)
//    }
}
