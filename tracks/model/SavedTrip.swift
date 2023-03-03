//
//  savedTrip.swift
//  tracks
//
//  Created by Valerio Mosca on 28/02/23.
//

import Foundation

struct SavedTrip : Identifiable, Codable{
    
    let id: UUID
    let name : String
    let startPoint : Station
    let endPoint : Station
    let iconName : String
    
    init(id: UUID, name: String, startPoint: Station, endPoint: Station, iconName: String) {
        self.id = id
        self.name = name
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.iconName = iconName
    }
    
    enum CodingKeys: String, CodingKey {
        case id, nome, puntoInizio, puntoFine, nomeIcona
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .nome)
        self.startPoint = try container.decode(Station.self, forKey: .puntoInizio)
        self.endPoint = try container.decode(Station.self, forKey: .puntoFine)
        self.iconName = try container.decode(String.self, forKey: .nomeIcona)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .nome)
        try container.encode(self.startPoint, forKey: .puntoInizio)
        try container.encode(self.endPoint, forKey: .puntoFine)
        try container.encode(self.iconName, forKey: .nomeIcona)
    }
}
