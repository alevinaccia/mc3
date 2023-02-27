//
//  tripEdit.swift
//  mc3
//
//  Created by Valerio Mosca on 23/02/23.
//

import SwiftUI

struct tripEditSheetView: View {
    let controller : ApiController = ApiController()
    @State var firstStation : statNameCode = statNameCode()
    @State var secondStation : statNameCode = statNameCode()
    @State var possibileTrips : [TrainStatus] = []
    
    
    var body: some View {
        
        searchTrip(firstStation: $firstStation, secondStation: $secondStation, possibleTrips: $possibileTrips)
        
        if !possibileTrips.isEmpty {
            List(possibileTrips, id : \.self) { trip in
                Text("\(trip.departStation) - \(trip.arrivalStation) \(trip.delay)").onAppear {
                    print(trip)
                }
            }
        } else {
            //
            Color.blue
        }
        
        
        iconSelector()
        Spacer()
    }
}

struct tripEditSheetView_Previews: PreviewProvider {
    static var previews: some View {
        tripEditSheetView()
    }
}
