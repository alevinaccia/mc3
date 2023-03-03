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
