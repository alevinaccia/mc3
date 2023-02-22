//
//  apiController.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 17/02/23.
//

import Foundation

struct trainInfo {
    let a : String
    let b : String
}

struct statNameCode {
    var name : String = "def"
    var code : String = "aaa"
}

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
    var timeAtMyStation : String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.departStation = try container.decode(String.self, forKey: .origine)
        self.arrivalStation = try container.decode(String.self, forKey: .destinazione)
        self.trainNumber = try container.decode(Int.self, forKey: .numeroTreno)
        self.delay = try container.decode(Int.self, forKey: .ritardo)
        self.stops = try container.decode([Stop].self, forKey: .fermate)
        self.departed = try container.decode([String].self, forKey: .compInStazionePartenza).contains(where: {$0 == "Partito"})
        self.timeAtMyStation = ""
        
    }
    
    init(departStation : String, arrivalStation : String, trainNumber : Int, delay : Int, stops : [Stop], departed : Bool, interestedStation : String) {
        self.departStation = departStation
        self.arrivalStation = arrivalStation
        self.trainNumber = trainNumber
        self.delay = delay
        self.stops = stops
        self.departed = departed
        self.timeAtMyStation = ""
        
        setTime(station: interestedStation)
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



struct Stop: Decodable {
    enum CodingKeys: String, CodingKey {
        case stazione, programmata, id
    }
    
    let station : String
    let departTime: String
    let stationCode : String
    
    init(station : String, departTime : String, stationCode : String) {
        self.station = station
        self.departTime = departTime
        self.stationCode = stationCode
    }
    
    init(from decoder: Decoder) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.station = try container.decode(String.self, forKey: .stazione)
        self.departTime = dateFormatter.string(from: Date(timeIntervalSince1970: Double(try container.decode(Int.self, forKey : .programmata)/1000)))
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

class ApiController {
    
    let findTrainUrl : URL = URL(string: "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/cercaNumeroTrenoTrenoAutocomplete/")!
    let trainStatusUrl : URL = URL(string: "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/andamentoTreno/")!
    let researchUrl : URL = URL(string: "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/autocompletaStazione/")!
    let deprturesUrl : URL = URL(string: "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/partenze/")!
    
    func getTrainInfo(code : String) async throws -> trainInfo? {
        do {
            let request = URLRequest(url: findTrainUrl.appendingPathComponent(code))
            let (data, _) = try await URLSession.shared.data(for: request)
            let res = String(decoding: data, as: UTF8.self)
            var format = res.split(separator: "|")[1].split(separator: "-")
            format[2].removeLast()
            return trainInfo(a: String(format[1]), b: String(format[2]))
        }
        catch {
            print(error)
        }
        return nil
    }
    
    func getTrainStatus(trainInfo : trainInfo, code : String) async throws -> TrainStatus {
        do {
            let request = URLRequest(url: trainStatusUrl.appendingPathComponent(trainInfo.a).appendingPathComponent(code).appendingPathComponent(trainInfo.b))
            let (data, _) = try await URLSession.shared.data(for: request)
            let res = try JSONDecoder().decode(TrainStatus.self, from: data)
            return res
        }
        catch {
            print(error)
            throw error
        }
    }
    
    func research(query : String) async throws -> [Substring]{
        do {
            let request = URLRequest(url: researchUrl.appendingPathComponent(query))
            let (data, _) = try await URLSession.shared.data(for: request)
            let res = String(decoding: data, as: UTF8.self).split(separator: "\n")
            return res
        }
        catch {
            print(error)
            throw error
        }
    }
    
    func getPossibleTrips(from : String, to : String) async throws -> [TrainStatus] {
        var trips : [TrainStatus] = []
        
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: Date())
            let request = URLRequest(url: deprturesUrl.appendingPathComponent(from).appendingPathComponent(dateString))
            let (data, _) = try await URLSession.shared.data(for: request)
            //decode data
            let departures = try JSONDecoder().decode([testStruct].self, from: data)
            
            for departure in departures {
                var train : TrainStatus = try await getTrainStatus(trainInfo: await getTrainInfo(code: departure.trainCode)!, code: departure.trainCode)
                
                if train.stops.contains(where: {$0.stationCode ==  to}) && train.stops.firstIndex(where: {$0.stationCode == to})! > train.stops.firstIndex(where: {$0.stationCode == from})! && !train.departed {
                    train.setTime(station: to)
                    trips.append(train)
                }
            }
            trips.reverse()
            return trips
        }
        catch {
            print(error)
            throw error
        }
    }
}

