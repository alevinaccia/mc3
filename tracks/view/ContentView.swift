//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    @StateObject var tripVM = TripViewModel.shared
    @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
    
    @State private var showingSheet = false
    
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                ForEach(0..<3) { i in
                    if(tripVM.userTrips.isEmpty){
                        CardViewEmpty(showingSheet: $showingSheet)
                            .padding()
                    }
                    else if (i < tripVM.userTrips.count){
                        CardView(trip: $tripVM.userTrips[i], showingSheet : $showingSheet)
                            .padding()
                            .sheet(isPresented: $showingSheet) {
                                tripEditSheetView(startPoint: tripVM.userTrips[i].startPoint, endPoint: tripVM.userTrips[i].endPoint)
                            }
                        
                        
                    }
                    else{
                        CardViewEmpty(showingSheet: $showingSheet).padding()
                    }
                }
                Text("Last Update:\(tripVM.lastUpdate)")
            }
            .refreshable {
                Task{
                    if !tripVM.userTrips.isEmpty{
                        await tripVM.updateTrips()
                        WatchConnectivityManager.shared.send(tripVM.userTrips[0].toDictionary())
                        print("done")
                    }
                }
            }
            .task {
                
                do {
                    try await TripViewModel.shared.readData()
                    if tripVM.userTrips.isEmpty {
                        WatchConnectivityManager.shared.send(tripVM.userTrips[0].toDictionary())
                    }
                        //TripViewModel.shared.clearData()
                }
                catch {
                    TripViewModel.shared.userTrips = []
                }
                
            }
            .navigationTitle("My routes")
        }
      
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            onboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
