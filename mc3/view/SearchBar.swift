//
//  SearchBar.swift
//  mc3
//
//  Created by Valerio Mosca on 23/02/23.
//

import SwiftUI

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("AccentColor1"))
                //.brightness(0.4)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search a station", text: $searchText) {
                    startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(searchText: <#Binding<String>#>, searching: <#Binding<Bool>#>)
//    }
//}
