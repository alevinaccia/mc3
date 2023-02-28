//
//  tripEdit.swift
//  mc3
//
//  Created by Valerio Mosca on 23/02/23.
//

import SwiftUI

struct tripEditSheetView: View {
    @State var firstStation : Station = Station()
    @State var secondStation : Station = Station()
    @State var possibileTrips : [TrainStatus] = []
    
    var flagPossibleTrip : Bool = false
    
    var body: some View {
        
        searchTrip(firstStation: $firstStation, secondStation: $secondStation, possibleTrips: $possibileTrips)
        
        if !possibileTrips.isEmpty {
            //ci sono delle tratte tra le due selezionate
            //flagPossibleTrip = true
//            List(possibileTrips, id : \.self) { trip in
//                Text("\(trip.departStation) - \(trip.arrivalStation) \(trip.delay)").onAppear {
//                    print(trip)
//                }
//            }
        } else {
            //non ci sono delle tratte
            iconSelector()
            
        }
        
        Spacer()
        
    }
}

struct tripEditSheetView_Previews: PreviewProvider {
    static var previews: some View {
        tripEditSheetView()
    }
}
