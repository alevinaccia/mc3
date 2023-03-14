//
//  CoreDataViewModel.swift
//  tracks
//
//  Created by Valerio Mosca on 10/03/23.
//

import Foundation
import CoreData
import Combine

class CoreDataViewModel: ObservableObject{
    
    let container: NSPersistentContainer
    
    @Published var storedSavedTrips: [CDSavedTrip] = []
    
    init(){
        container = NSPersistentContainer(name: "tracks")
        container.loadPersistentStores{description, error in
            if let error = error{
                print("Error Loading \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        //load array
    }
    
    func fetchStoredTrip(){
        let request = NSFetchRequest<CDSavedTrip>(entityName: "SavedTrip")
//        let sectionSortDescriptor = NSSortDescriptor(key: "attribute", ascending: true)
//        let sortDescriptors = [sectionSortDescriptor]
//        request.sortDescriptors = sortDescriptors
        do{
            storedSavedTrips = try container.viewContext.fetch(request)
        }catch let error{
            print("ERROR FETCHING! \(error)")
        }
    }
    
    func addTrip(nameIn: String, iconNameIn: String, idIn: UUID, startingPointIn: CDStation, endingPointIn: CDStation){
            
        let newSavedTrip = CDSavedTrip(context: container.viewContext)
        
        newSavedTrip.name = nameIn
        newSavedTrip.iconName = iconNameIn
        newSavedTrip.id = idIn
        
        newSavedTrip.hasAStartingPoint = startingPointIn
        newSavedTrip.hasAnEndingPoint = endingPointIn
        
        saveContext()
        //ricarica l'array
        fetchStoredTrip()
    }
    
    func saveContext(){
        do {
            try container.viewContext.save()
            print("Context saved.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
