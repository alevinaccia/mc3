//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    
    let controller : ApiController = ApiController()
    @State var firstStation : statNameCode = statNameCode()
    @State var secondStation : statNameCode = statNameCode()
    @State var possibileTrips : [TrainStatus] = []
    
    var body: some View {
        NavigationView{
            
        }.navigationTitle("Train Station")
        searchTrip(firstStation: $firstStation, secondStation: $secondStation, possibleTrips: $possibileTrips)
        List(possibileTrips, id : \.self) { trip in
            Text("\(trip.departStation) - \(trip.arrivalStation) \(trip.delay)").onAppear {
                print(trip)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
