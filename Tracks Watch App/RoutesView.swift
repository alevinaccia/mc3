//
//  RoutesView.swift
//  mc3
//
//  Created by antonia on 27/02/23.
//

import SwiftUI

struct RoutesView: View {
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

struct RoutesView_Previews: PreviewProvider {
    static var previews: some View {
        RoutesView()
    }
}

