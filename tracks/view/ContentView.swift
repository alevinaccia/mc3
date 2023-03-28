//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    @StateObject var viewController = ContentViewModel()
    @StateObject var tripVM = TripViewModel.shared
    @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
    
    var locManager = CLLocationManager()
    
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
                    if !tripVM.userTrips.isEmpty {
                        WatchConnectivityManager.shared.send(tripVM.userTrips[0].toDictionary())
                    }
                    //TripViewModel.shared.clearData()
                }
                catch {
                    TripViewModel.shared.userTrips = []
                }
                
            }
            .navigationTitle("My routes")
        }.onAppear(){
            if (viewController.checkIfLocationServicesIsEnabled()){
                viewController.initLocation()
            }
        }.onChange(of: viewController.locationManager?.location?.coordinate.longitude, perform: {_ in
            print("User Latitude \(viewController.getUserLocation().lat)")
            print("User Longitude \(viewController.getUserLocation().lon)")
            let coordinate1 = CLLocation(latitude: viewController.getUserLocation().lat, longitude: viewController.getUserLocation().lon)
            let coordinate2 = CLLocation(latitude: 45.433866, longitude: 9.2391)
            let distanceInMeters = coordinate1.distance(from: coordinate2) // result is in meters
            print(distanceInMeters)
        })
      
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
