//
//  Station.swift
//  tracks
//
//  Created by Valerio Mosca on 28/02/23.
//

import Foundation


struct Station : Codable {
    var name : String 
    var code : String
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.departStation = try container.decode(String.self, forKey: .origine)
//        self.arrivalStation = try container.decode(String.self, forKey: .destinazione)
//        self.trainNumber = try container.decode(Int.self, forKey: .numeroTreno)
//        self.delay = try container.decode(Int.self, forKey: .ritardo)
//        self.stops = try container.decode([Stop].self, forKey: .fermate)
//        self.departed = try container.decode([String].self, forKey: .compInStazionePartenza).contains(where: {$0 == "Partito"})
//        self.timeAtMyStation = 0
//    }
    enum CodingKeys: String, CodingKey {
        case nome, codice
    }
    
    init(){
        self.name = "defaultName"
        self.code = "defaultCode"
    }
    
    init(name : String, code : String){
        self.name = name
        self.code = code
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .nome)
        self.code = try container.decode(String.self, forKey: .codice)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .nome)
        try container.encode(code, forKey: .codice)
    }
}
