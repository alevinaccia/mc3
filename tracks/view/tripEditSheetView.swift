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
    
    @State var flagTextField1 : Bool = false
    @State var flagTextField2 : Bool = false
    @State var flagWaitResults : Bool = false
    
    //var trip : Trip
  
    var body: some View {
        
        NavigationStack(){
            VStack{
                searchTrip(firstStation: $startPoint, secondStation: $endPoint, possibleTrips: $possibileTrips, tagName: $tagName, iconName: $iconName, flagTextField1: $flagTextField1, flagTextField2: $flagTextField2, flagWaitResults: $flagWaitResults)
                
                
            }.navigationBarTitle("Create Event", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    Task {
//                        print("1 \(flagTextField1)")
//                        print("2 \(tagName.isEmpty)")
//                        print("3 \(iconName.isEmpty)")
//                        print("4 \(flagTextField2)")
                        if(flagTextField1 && flagTextField2 && !tagName.isEmpty && !iconName.isEmpty && !possibileTrips.isEmpty){
                            
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
                    }
                }, label: {
                    Text("Done")
                })
                    .disabled(!(flagTextField2 && flagTextField1 && !tagName.isEmpty && !iconName.isEmpty && !possibileTrips.isEmpty))
                )
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
