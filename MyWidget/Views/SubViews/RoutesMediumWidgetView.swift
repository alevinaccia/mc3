//
//  RoutesMediumWidgetView.swift
//  tracks
//
//  Created by Alessandro Vinaccia on 08/03/23.
//  {

import Foundation
import SwiftUI

struct RoutesMediumWidgetView: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 24, style: .continuous).fill(.white)
                .shadow(radius: 10)
                .frame(width: 329, height: 155)
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                        ButtonView(imageName: "house"){
              
                        }
                        Spacer()
                        ButtonView(imageName: "briefcase"){
              
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        ButtonView(imageName: "graduationcap"){
              
                        }
                        Spacer()
                        ButtonView(imageName: "book.closed"){
              
                        }
                        Spacer()
                    }
                }
                .padding()
                .frame(width: 329, height: 155)
            }
        }
    }
}
