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

class ApiController {
    
    static let shared = ApiController()
    
    private init() {
    }
    
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
    
    func getPossibleTrains(from : String, to : String) async throws -> [TrainStatus] {
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
                
                if train.stops.contains(where: {$0.station.code ==  to}) && train.stops.firstIndex(where: {$0.station.code == to})! > train.stops.firstIndex(where: {$0.station.code == from})! && !train.departed {
                    train.setTime(station: from)
                    train.setTrack(track: departure.track ?? "-")
                    
                    if (Double(train.timeAtMyStation) > Date().timeIntervalSince1970) {
                        trips.append(train)
                    }
                }
                
                if trips.count > 1 {
                    break
                }
            }
            return trips
        }
        catch {
            print(error)
            throw error
        }
    }

}

