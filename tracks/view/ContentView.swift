//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @State var trips = TripViewModel.shared.userTrips
    
    var body: some View {
        
        NavigationStack {
            VStack{
                ForEach(0..<4) { i in
                    if(trips.isEmpty){
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
                    else if (i < trips.count){
                        CardView(trip: trips[i])
                    }
                    else{
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
                }
                
                
            }.task {
                do {
                    try await TripViewModel.shared.readData()
                    trips = TripViewModel.shared.userTrips
                    //TripViewModel.shared.clearData()
                }
                catch {
                    TripViewModel.shared.userTrips = []
                }
            
            }.refreshable {
                
            }
            .navigationTitle("Train Stations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
