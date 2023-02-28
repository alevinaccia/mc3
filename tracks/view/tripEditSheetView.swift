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
                    do {
                        try
                        addTripLocal(nameIn: tagName, startPointIn: startPoint, endPointIn: endPoint, iconNameIn: iconName)
                        dismiss()
                    }catch{
                        //how do I show them the error? alerts are deprecated, Should I set the button unclickable? How?
                        print("Missing field")
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

private func addTripLocal(nameIn: String, startPointIn: Station, endPointIn: Station, iconNameIn: String) throws{
    
    guard startPointIn.name != "" && endPointIn.name != "" else {throw FormSubmissionError.missingInput}
    
    let tripId: UUID = UUID()
    var tripName = nameIn
    var startPoint = startPointIn
    var endPoint = endPointIn
    var iconName = iconNameIn
    
    let newTrip: SavedTrip = SavedTrip(id: tripId, name: tripName, startPoint: startPointIn, endPoint: endPointIn, iconName: iconNameIn)
    
    TripViewModel.shared.saveJsonFile(newSavedTrip: newTrip)
    
}

//struct tripEditSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        tripEditSheetView(, trip: Trip(id: UUID(), name: "Home", possibleTrips: [TrainStatus(departStation: "NAPOLI S.GIOV.BARRA", arrivalStation: "POZZUOLI SOLFATARA", trainNumber: 20944, delay: 0, stops: [Stop(station: "NAPOLI S.GIOV.BARRA", departTime: "13:13", stationCode: "S09800"), Stop(station: "NAPOLI GIANTURCO", departTime: "13:21", stationCode: "S09110"), Stop(station: "NAPOLI PIAZZA GARIBALDI", departTime: "13:25", stationCode: "S09109"), Stop(station: "PIAZZA CAVOUR", departTime: "13:31", stationCode: "S09108"), Stop(station: "NAPOLI MONTESANTO", departTime: "13:34", stationCode: "S09107"), Stop(station: "PIAZZA AMEDEO", departTime: "13:37", stationCode: "S09106"), Stop(station: "NAPOLI MERGELLINA", departTime: "13:42", stationCode: "S09105"), Stop(station: "NAPOLI PIAZZA LEOPARDI", departTime: "13:46", stationCode: "S09104"), Stop(station: "NAPOLI CAMPI FLEGREI", departTime: "13:51", stationCode: "S09103"), Stop(station: "CAVALLEGGERI AOSTA", departTime: "13:55", stationCode: "S09113"), Stop(station: "BAGNOLI AGNANO TERME", departTime: "13:59", stationCode: "S09102"), Stop(station: "POZZUOLI SOLFATARA", departTime: "14:06", stationCode: "S09101")], departed: false, timeAtMyStation: "")], startPoint: "casa", endPoint: "lavoro"))
//    }
//}
