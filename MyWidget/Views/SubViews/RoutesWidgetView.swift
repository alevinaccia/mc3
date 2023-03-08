//
//  RoutesWidgetView.swift
//  tracks
//
//  Created by Alessandro Vinaccia on 08/03/23.
//

import SwiftUI

struct RoutesWidgetView: View {
    var body: some View {
        VStack{
            
            HStack{
                
                
                ButtonView(imageName: "house") {
                    print("ciao")
                }
                
                ButtonView(imageName: "briefcase") {
                    print("ciao")
                }
                
                
                
            }
            Spacer()
            Spacer()
            HStack{
                
                ButtonView(imageName: "graduationcap") {
                    print("ciao")
                }
                
                ButtonView(imageName: "book.closed") {
                    print("ciao")
                }
                
                
                
            }
        }
        .padding(.all, 20.0)
        .background(Color("Notte"))
        
    }
}

struct RoutesWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        RoutesWidgetView()
    }
}

