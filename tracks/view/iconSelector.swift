//
//  iconSelector.swift
//  mc3
//
//  Created by Valerio Mosca on 24/02/23.
//

import SwiftUI

let iconsArray = ["house","briefcase","graduationcap","book.closed","building.columns","wineglass"]



struct iconSelector: View {
    @State var colorDefault : String = "Notte"
    @State var selectedIcon : String = ""
    @State var selectedTextField : Bool = false
    
    @Binding var tagName: String
    @Binding var iconName: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Tag:")
                    .foregroundColor(.black)
                    .bold()
                    .frame(minWidth: 30)
                    .padding(16)
                
                TextField("Inserisci tag", text: $tagName,
                          onEditingChanged: { (isBegin) in
                    if isBegin {
                        print("Begins editing")
                        selectedTextField = true
                    } else {
                        print("Finishes editing")
                        selectedTextField = false
                    }
                },
                          onCommit: {
                    print("commit")
                })
                .padding()
                .bold()
            }
            .frame(width: 329, height: 36)
            //.background(RoundedRectangle(cornerRadius: 8).fill(Color("Notte")))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("Notte"), lineWidth: 4)
            )
            
            HStack{
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(iconsArray, id: \.self){ icon in
                            Button {
                                print(icon)
                                selectedIcon = icon
                                colorDefault = "Tuorlo"
                            } label: {
                                Text("\(Image(systemName: "\(icon)"))")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color( icon == selectedIcon ? "Tuorlo" : "Notte" ))
                                    .clipShape(Circle())
                            }
                        }
                    }.padding()
                    
                }
            }.frame(width: 329, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Notte"), lineWidth: 4))
        }
    }
}

//struct iconSelector_Previews: PreviewProvider {
//    static var previews: some View {
//        iconSelector()
//    }
//}
