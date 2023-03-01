//
//  tripController.swift
//  mc3
//
//  Created by Valerio Mosca on 27/02/23.
//

import Foundation

class TripViewModel: ObservableObject{
    
    static var shared : TripViewModel = TripViewModel()
    private init(){
    }
    @Published var userTrips: [Trip] = []
    @Published var savedTrips: [SavedTrip] = []
    
    func saveJsonFile(newSavedTrip : SavedTrip){
        savedTrips.append(newSavedTrip)
        writeData(savedTrips: savedTrips)
    }
    
    func writeData(savedTrips : [SavedTrip]) -> Void {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("data.json")
            print(fileURL)
            try JSONEncoder()
                .encode(savedTrips)
                .write(to: fileURL)
        } catch {
            print("error writing data")
        }
    }
    
    func readData() async throws {
        do {
            let dataURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("data.json")
            
            let data = try Data(contentsOf: dataURL)
            
            let arrayTrips = try JSONDecoder().decode([SavedTrip].self, from: data)
            
            TripViewModel.shared.savedTrips = arrayTrips
            await self.generateTrips()
            
        } catch {
            throw error
        }
    }
    
    func generateTrips() async{
        for savedTrip in savedTrips {
            var newTrip = Trip(id: savedTrip.id, name: savedTrip.name, startPoint: savedTrip.startPoint, endPoint: savedTrip.endPoint)
            await newTrip.updateTrips()
            TripViewModel.shared.userTrips.append(newTrip)
        }
    }
}
