//
//  thirdView.swift
//  tracks
//
//  Created by Valerio Mosca on 07/03/23.
//

import SwiftUI

struct thirdView: View {
    let backgroundImage = Image("Onboarding3")
    var body: some View {
        ZStack{
            backgroundImage.resizable()
                .scaledToFill()
            VStack{
                
                Image("Frame 22")
                    .resizable()
                    .bold()
                    .frame(width: 330.0, height: 586.0)
                    .padding()
                
                VStack(alignment: .leading){
                    //                    Text("Watch App")
                    //                        .bold()
                    //                        .font(.system(size: 34))
                    //
                    VStack(alignment: .leading){
                        Text("Watch App")
                            .padding()
                            .bold()
                            .font(.system(size: 34))
                        Text("To have an immersive experience of our services we also suggest you to download the Watch app!")
                            .padding(.leading)
                            .padding(.trailing)
                    }.padding(.top, -80)
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
}

struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}
