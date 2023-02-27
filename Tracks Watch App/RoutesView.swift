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
                Button {
                    print("ciao")
                } label: {
                    Text(Image(systemName:"house"))
                }
                .background(Color("Tuorlo"))
                .foregroundColor(Color("Notte"))
                .clipShape(Circle())
                
                Button {
                    print("ciao")
                } label: {
                    Text(Image(systemName:"briefcase"))
                }
                
                .background(Color("Tuorlo"))
                .foregroundColor(Color("Notte"))
                .clipShape(Circle())
                
            }
            Spacer()
            
            HStack{
            Button {
                print("ciao")
            } label: {
                Text(Image(systemName:"graduationcap"))
            }
            
            .background(Color("Tuorlo"))
            .foregroundColor(Color("Notte"))
            .clipShape(Circle())
                
                Button {
                    print("ciao")
                } label: {
                    Text(Image(systemName:"book.closed"))
                        
                }
                
                .background(Color("Tuorlo"))
                .foregroundColor(Color("Notte"))
                .clipShape(Circle())
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

