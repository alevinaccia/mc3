////
////  searchTrip.swift
////  mc3
////
////  Created by Alessandro Vinaccia on 21/02/23.
////
//
//import SwiftUI
//
//struct searchTrip: View {
//    @Binding var firstStation : statNameCode
//    @Binding var secondStation : statNameCode
//    @State var queryRequest : String = ""
//    @State var searchResult : [Substring] = []
//    @Binding var possibleTrips : [TrainStatus]
//    var controller : ApiController = ApiController()
//
//    var body: some View {
//        VStack {
//            Text(firstStation.name)
//            Text(secondStation.name)
//            TextField("search", text: $queryRequest)
//                .onChange(of: queryRequest) { newValue in
//                    if queryRequest == "" {
//                        searchResult = []
//                        return
//                    }
//                    Task{
//                        searchResult = try await controller.research(query: queryRequest)
//                    }
//                }
//            List(searchResult, id: \.self) { res in
//                Button {
//                    if firstStation.name == "def" {
//                        let format = res.split(separator: "|")
//                        firstStation.name = String(format[0])
//                        firstStation.code = String(format[1])
//                        queryRequest = ""
//                    }else {
//                        let format = res.split(separator: "|")
//                        secondStation.name = String(format[0])
//                        secondStation.code = String(format[1])
//                        queryRequest = ""
//                    }
//                } label: {
//                    Text(res)
//                }
//            }.onChange(of: secondStation.name) { newValue in
//                Task {
//                    possibleTrips = try await controller.getPossibleTrips(from: firstStation.code, to: secondStation.code)
//                }
//            }
//        }
//    }
//}
//

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
    @State var queryRequestStart : String = ""
    @State var queryRequestEnd : String = ""
    @State var searchResult : [Substring] = []
    @Binding var possibleTrips : [TrainStatus]
    var controller : ApiController = ApiController()
    
    @State var selectedFirstBar : Bool = false
    @State var selectedSecondBar : Bool = false
    @State var startingPoint : String = "Stazione di partenza"
    @State var endingPoint : String = "Stazione di arrivo"
    
    var body: some View {
        
        
        
        VStack {
            Text(firstStation.name)
            Text(secondStation.name)
            HStack{
                Text("da: ")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                TextField(startingPoint, text: $queryRequestStart,
                          onEditingChanged: { (isBegin) in
                    if isBegin {
                        print("Begins editing")
                        selectedFirstBar = true
                    } else {
                        print("Finishes editing")
                        selectedFirstBar = false
                    }
                },
                          onCommit: {
                    print("commit")
                })
                .bold()
                .padding()
                .foregroundColor(.white)
                .onChange(of: queryRequestStart) { newValue in
                    if queryRequestStart == "" {
                        searchResult = []
                        return
                    }
                    Task{
                        searchResult = try await controller.research(query: queryRequestStart)
                    }
                }
            }.frame(width: 329, height: 36)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color("Notte")))
            
            
            
            HStack{
                Text("a: ")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                TextField(endingPoint, text: $queryRequestEnd, onEditingChanged: { (isBegin) in
                    if isBegin {
                        print("Begins editing")
                        selectedSecondBar = true
                        
                    } else {
                        print("Finishes editing")
                        selectedSecondBar = false
                    }
                },
                          onCommit: {
                    print("commit")
                })
                .padding()
                .bold()
                
                .onChange(of: queryRequestEnd) { newValue in
                    if queryRequestEnd == "" {
                        searchResult = []
                        return
                    }
                    Task{
                        searchResult = try await controller.research(query: queryRequestEnd)
                    }
                }
            }.frame(width: 329, height: 36)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color("Notte")))
                
            
            List{
                ForEach(searchResult, id: \.self) { res in
                    Button {
                        print(selectedFirstBar)
                        if (selectedFirstBar == true) {
                            print("prova")
                            let format = res.split(separator: "|")
                            firstStation.name = String(format[0])
                            firstStation.code = String(format[1])
                            startingPoint = firstStation.name
                            queryRequestStart = ""
                        }else if (selectedSecondBar == true){
                            let format = res.split(separator: "|")
                            secondStation.name = String(format[0])
                            secondStation.code = String(format[1])
                            queryRequestEnd = ""
                            endingPoint = secondStation.name
                        }
                    } label: {
                        Text(res)
                    }
                }
            }
            
            
        }.onChange(of: secondStation.name) { newValue in
            Task {
                possibleTrips = try await controller.getPossibleTrips(from: firstStation.code, to: secondStation.code)
            }
        }
    }
}



