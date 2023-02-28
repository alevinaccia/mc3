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
        do{
            savedTrips.append(newSavedTrip)
            writeData(savedTrips: savedTrips)
        }catch{
            print("Impossibile salvare")
        }
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
    
    
    func readData() {
        do {
            let dataURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("data.json")
            
            let data = try Data(contentsOf: dataURL)
            
            let arrayTrips = try JSONDecoder().decode([SavedTrip].self, from: data)
            
            
            TripViewModel.shared.savedTrips = arrayTrips
            
            
            print("I've been called!")
        } catch {
            print("error reading data")
        }
    }
}
