//
//  ContentView.swift
//  Tracks Watch App
//
//  Created by antonia on 24/02/23.
//

import SwiftUI

struct SelectedRouteView: View {
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image(systemName: "house")
                Text("Home")
                    .fontWeight(.semibold)
                Spacer()
                
            }
            Spacer()
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
            HStack {
                
                Text("300 mt")
                    .fontWeight(.semibold)
                Image(systemName: "train.side.front.car")
            }
            .padding(.bottom, 20.0)
            Text("Refreshed at 8:28")
                .fontWeight(.thin)
           
        }
        .padding()
        .background(Color("Notte"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRouteView()
    }
}