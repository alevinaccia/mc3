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
            VStack{
                ForEach(0..<3) { i in
                    if(tripVM.userTrips.isEmpty){
                        CardViewEmpty(showingSheet: $showingSheet).padding()
                    }
                    else if (i < tripVM.userTrips.count){
                        CardView(trip: $tripVM.userTrips[i])
                            .padding()
                            .contextMenu {
                            Button {
                                print("Change country setting")
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Delete Trip", systemImage: "location.circle").accentColor(.red)
                            }
                        }
                    }
                    else{
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
                }
                Text("Last update : \(tripVM.lastUpdate)")
                Button {
                    Task{
                        await tripVM.updateTrips()
                        WatchConnectivityManager.shared.send(tripVM.userTrips[0].toDictionary())
                        print("done")
                    }
                    
                } label: {
                    Text("refresh")
                }
            }
            .task {
                
                do {
                    try await TripViewModel.shared.readData()
                    WatchConnectivityManager.shared.send(tripVM.userTrips[0].toDictionary())
                    TripViewModel.shared.clearData()
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
