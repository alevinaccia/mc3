//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @State var userTrips: [Trip] = []
    
    var body: some View {
        
        NavigationStack {
            VStack{
                ForEach(0..<4) { i in
                    if(userTrips.isEmpty){
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
                    else if (i <= userTrips.count){
                        CardView(card: userTrips[i])
                    }
                    else{
                        CardViewEmpty(showingSheet: $showingSheet)
                    }
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
