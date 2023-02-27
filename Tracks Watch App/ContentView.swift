//
//  ContentView.swift
//  Tracks Watch App
//
//  Created by antonia on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "house")
                Text("Home")
                Spacer()
                Text("300 mt")
            }
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 134.0, height: 33.0)
                    .foregroundColor (Color( "Tuorlo"))
                Text("5 mins")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Notte"))
                    
                    
            }
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 134.0, height: 33.0)
                    .foregroundColor (Color( "Tuorlo"))
                Text("10 mins")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Notte"))
                    
                    
            }
            Spacer()
            Text("Refreshed at 8:30")
           
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
