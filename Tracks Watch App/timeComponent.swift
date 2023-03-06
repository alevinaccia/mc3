//
//  timeComponent.swift
//  Tracks Watch App
//
//  Created by Alessandro Vinaccia on 06/03/23.
//

import SwiftUI

struct timeComponent: View {
    @Binding var trip : Trip
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 134.0, height: 33.0)
                .foregroundColor (Color( "Tuorlo"))
            Text("\(trip.nextArrivals[0]) min")
                .fontWeight(.semibold)
                .foregroundColor(Color("Notte"))
        }
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 134.0, height: 33.0)
                .foregroundColor (Color( "Tuorlo"))
            Text("\(trip.nextArrivals[1]) min")
                .fontWeight(.semibold)
                .foregroundColor(Color("Notte"))
        }
    }
}
