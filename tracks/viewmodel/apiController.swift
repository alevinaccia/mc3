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
    let departuresUrl : URL = URL(string: "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/partenze/")!
    
    //per prendere lat e lon
    let locationUrl : URL = URL(string:
    "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/dettaglioStazione/")! //dopo vuole il codice stazione e il codice regione
    
    //per avere il codice regione
    let regionCodeUrl : URL = URL(string:
    "http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/regione/")! //dopo vuole il codice stazione
    
    func getCoordinates(codeStat: String, codReg: String) async throws -> Coordinates{
            let request = URLRequest(url: locationUrl
                .appendingPathComponent(codeStat)
                .appendingPathComponent(codReg))
            let (data, _) = try await URLSession.shared.data(for: request)
            let res = try JSONDecoder().decode(Coordinates.self, from: data)
            return res
    }
    
    func getRegionCode(codeStat: String) async throws -> String{
        do{
            let request = URLRequest(url: regionCodeUrl
                .appendingPathComponent(codeStat))
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let stringInt = String.init(data: data, encoding: String.Encoding.utf8)
            //let regionCode = Int.init(stringInt ?? "")
            return stringInt ?? ""
        }catch{
            print("error Code Region")
            throw error
        }
    }
    
    func getTrainInfo(code : String) async throws -> trainInfo? {
        do {
            let request = URLRequest(url: findTrainUrl.appendingPathComponent(code))
            let (data, _) = try await URLSession.shared.data(for: request)
            let res = String(decoding: data, as: UTF8.self)
            var format = res.split(separator: "|")[1].split(separator: "-")
            //print(String(format[2].removeLast()))
            format[2].removeLast()
            //print(String(format[1]), String(format[2]))
            return trainInfo(a: String(format[1]), b: String(format[2]))
        }
        catch {
            print("error getTrainInfo")
            print(error)
        }
        return nil
    }
    
    func getTrainStatus(trainInfo : trainInfo, code : String) async throws -> TrainStatus {
        do {
            let request = URLRequest(url: trainStatusUrl.appendingPathComponent(trainInfo.a).appendingPathComponent(code).appendingPathComponent(trainInfo.b))
            let (data, _) = try await URLSession.shared.data(for: request)
            //print(request)
            let res = try JSONDecoder().decode(TrainStatus.self, from: data)
            return res
        }
        catch {
            print("errore GetTrainStatus")
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
            print("error research")
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
            let request = URLRequest(url: departuresUrl.appendingPathComponent(from).appendingPathComponent(dateString))
            let (data, _) = try await URLSession.shared.data(for: request)
            //decode data
            let departures = try JSONDecoder().decode([testStruct].self, from: data)
            
            for departure in departures {
                var train : TrainStatus? = try await getTrainStatus(trainInfo: await getTrainInfo(code: departure.trainCode)!, code: departure.trainCode)
                
                if train != nil {
                    if train!.stops.contains(where: {$0.station.code ==  to}) && train!.stops.firstIndex(where: {$0.station.code == to})! > train!.stops.firstIndex(where: {$0.station.code == from})! && !train!.departed {
                        train!.setTime(station: from)
                        train!.setTrack(track: departure.track ?? "-")
                        
                        if (Double(train!.timeAtMyStation) > Date().timeIntervalSince1970) {
                            trips.append(train!)
                        }
                    }
                }
                
                if trips.count > 1 {
                    break
                }
            }
            return trips
        }
        catch {
            print("error getPossibleTrain")
            print(error)
            throw error
        }
    }

}

