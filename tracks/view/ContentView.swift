//
//  ContentView.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 16/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    //@State var userTrips : [Trip] = []
    
    var body: some View {

        NavigationView(){
            VStack{
                Text("Ciao")
            }
            .navigationTitle("Train Stations")
            .toolbar{
                ToolbarItem{
                    Button{
                        showingSheet.toggle()
                        
                    }label: {
                        Label("Add Item", systemImage: "plus")
                    }
                    .sheet(isPresented: $showingSheet) {
                        tripEditSheetView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
