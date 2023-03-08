//
//  tripEdit.swift
//  mc3
//
//  Created by Valerio Mosca on 23/02/23.
//

import SwiftUI

struct tripEditSheetView: View {
    @Environment(\.dismiss) var dismiss
    //@StateObject var viewModel: TripViewModel
    
    @State var startPoint : Station = Station()
    @State var endPoint : Station = Station()
    @State var possibileTrips : [TrainStatus] = []
    @State var tagName : String = ""
    @State var iconName : String = ""
    
    
    //var trip : Trip
    
    var body: some View {
        
        var flagPossibleTrip : Bool = false
        
        NavigationStack(){
            VStack{
                searchTrip(firstStation: $startPoint, secondStation: $endPoint, possibleTrips: $possibileTrips, tagName: $tagName, iconName: $iconName)
                
                if !possibileTrips.isEmpty {
                    //ci sono delle tratte tra le due selezionate
                    VStack{
                        //                List(possibileTrips, id : \.self) { trip in
                        //                    Text("\(trip.departStation) - \(trip.arrivalStation) \(trip.delay)").onAppear {
                        //                        print(trip)
                        //                    }
                        //                }
                    }.onAppear(){
                        flagPossibleTrip = true
                    }
                } else {
                    //non ci sono delle tratte
                }
            }.navigationBarTitle("Create Event", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    Task {
                        do {
                            dismiss()
                            try
                            await addTripLocal(nameIn: tagName, startPointIn: startPoint, endPointIn: endPoint, iconNameIn: iconName)
                        }
                        catch{
                            //how do I show them the error? alerts are deprecated, Should I set the button unclickable? How?
                            print("Missing field")
                        }
                    }
                }, label: {
                    Text("Done")
                }))
                .navigationBarItems(leading: Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                }))
        }
        Spacer()
    }
}

enum FormSubmissionError: Error {
    case missingInput
    case anyOtherKindofError
}

private func addTripLocal(nameIn: String, startPointIn: Station, endPointIn: Station, iconNameIn: String) async throws{
    
    guard startPointIn.name != "" && endPointIn.name != "" else {throw FormSubmissionError.missingInput}
    
    let tripId: UUID = UUID()
    let tripName = nameIn
    
    let newTrip: SavedTrip = SavedTrip(id: tripId, name: tripName, startPoint: startPointIn, endPoint: endPointIn, iconName: iconNameIn)
    
    await TripViewModel.shared.saveJsonFile(newSavedTrip: newTrip)
    
}

struct tripEditSheetView_Previews: PreviewProvider {
    static var previews: some View {
        tripEditSheetView()
    }
}
