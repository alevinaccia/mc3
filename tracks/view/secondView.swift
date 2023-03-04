//
//  secondView.swift
//  tracks
//
//  Created by Valerio Mosca on 03/03/23.
//

import SwiftUI

struct secondView: View {
    let showDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        Image("w")
        VStack{
            Image("widget")
                .padding()
            VStack(alignment: .leading){
                Text("Widgets")
                    .bold()
                    .font(.system(size: 34))
                    .padding()
                Text("Tracks provides you a smarter way to check your trains’ timetables, letting you wrap them in widgets, like the ones above for example.")
                    .padding()
            }
        }
    }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView(showDismissButton: false, shouldShowOnboarding: .constant(false))
    }
}
