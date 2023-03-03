//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @StateObject var tripVM = TripViewModel.shared
    
    var body: some View {
        
        NavigationStack {
            VStack{
                ForEach(0..<4) { i in
                    if(tripVM.userTrips.isEmpty){
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
                    else if (i < tripVM.userTrips.count){
                        CardView(trip: $tripVM.userTrips[i])
                    }
                    else{
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
                }
                Button {
                    
                    Task{
                        await tripVM.updateTrips()
                        print("done")
                    }
                    
                } label: {
                    Text("refresh + \(tripVM.reloader)")
                }

            }
            .task {
                do {
                    try await TripViewModel.shared.readData()
                    //TripViewModel.shared.clearData()
                }
                catch {
                    TripViewModel.shared.userTrips = []
                }
            
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
