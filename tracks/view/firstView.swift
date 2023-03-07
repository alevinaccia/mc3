//
//  firstView.swift
//  tracks
//
//  Created by Valerio Mosca on 03/03/23.
//

import SwiftUI

struct firstView: View {
    let backgroundImage = Image("Onboarding1")
    
    var body: some View {
        ZStack{
            backgroundImage.resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 15){
                Text("Welcome to TRACKS!")
                    .bold()
                    .font(.system(size: 34))
                Text("Afraid of missing your train? ")
                Text("Too busy to search for train infos? ")
                Text("Don’t worry, Tracks is here to help you!")
            }
        }.ignoresSafeArea()
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
