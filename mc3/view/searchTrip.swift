//
//  searchTrip.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 21/02/23.
//

import SwiftUI

struct searchTrip: View {
    @Binding var firstStation : statNameCode
    @Binding var secondStation : statNameCode
    @State var queryRequest : String = ""
    @State var searchResult : [Substring] = []
    @Binding var possibleTrips : [TrainStatus]
    var controller : ApiController = ApiController()
    
    var body: some View {
        VStack {
            Text(firstStation.name)
            Text(secondStation.name)
            TextField("search", text: $queryRequest)
                .onChange(of: queryRequest) { newValue in
                    if queryRequest == "" {
                        searchResult = []
                        return
                    }
                    Task{
                        searchResult = try await controller.research(query: queryRequest)
                    }
                }
            List(searchResult, id: \.self) { res in
                Button {
                    if firstStation.name == "def" {
                        let format = res.split(separator: "|")
                        firstStation.name = String(format[0])
                        firstStation.code = String(format[1])
                        queryRequest = ""
                    }else {
                        let format = res.split(separator: "|")
                        secondStation.name = String(format[0])
                        secondStation.code = String(format[1])
                        queryRequest = ""
                    }
                } label: {
                    Text(res)
                }
            }.onChange(of: secondStation.name) { newValue in
                Task {
                    possibleTrips = try await controller.getPossibleTrips(from: firstStation.code, to: secondStation.code)
                }
            }
        }
    }
}
