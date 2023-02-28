import SwiftUI

struct searchTrip: View {
    
    @Binding var firstStation : Station
    @Binding var secondStation : Station
    @State var queryRequestStart : String = ""
    @State var queryRequestEnd : String = ""
    @State var searchResult : [Substring] = []
    @Binding var possibleTrips : [TrainStatus]

    @State var selectedFirstBar : Bool = false
    @State var selectedSecondBar : Bool = false
    @State var startingPoint : String = "Stazione di partenza"
    @State var endingPoint : String = "Stazione di arrivo"
    
    var body: some View {
   
        VStack {
            Text(firstStation.name)
            Text(secondStation.name)
            
            HStack{
                Text("da:")
                    .foregroundColor(.black)
                    .bold()
                    .frame(minWidth: 30)
                    .padding(16)
                    
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
                .padding()
                .bold()
                .onChange(of: queryRequestStart) { newValue in
                    if queryRequestStart == "" {
                        searchResult = []
                        return
                    }
                    Task{
                        searchResult = try await ApiController.shared.research(query: queryRequestStart)
                    }
                }
            }
            .frame(width: 329, height: 36)
            //.background(RoundedRectangle(cornerRadius: 8).fill(Color("Notte")))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Notte"), lineWidth: 4)
                )
            
            
            HStack{
                Text("a:")
                    .foregroundColor(.black)
                    .bold()
                    .frame(minWidth: 30)
                    .padding(16)
                
                TextField(endingPoint, text: $queryRequestEnd, onEditingChanged: { (isBegin) in
                    if isBegin {
                        selectedSecondBar = true
                        
                    } else {
                        selectedSecondBar = false
                    }
                },
                          onCommit: {
                })
                .padding(.leading)
                .bold()
                .onChange(of: queryRequestEnd) { newValue in
                    if queryRequestEnd == "" {
                        searchResult = []
                        return
                    }
                    Task{
                        searchResult = try await ApiController.shared.research(query: queryRequestEnd)
                    }
                }
            }
            .padding(.trailing)
            .frame(width: 329, height: 36)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Notte"), lineWidth: 4)
                )
            
            if !searchResult.isEmpty {
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
                .transition(.slide)
            } 
            
            
        }.onChange(of: secondStation.name) { newValue in
            Task {
                possibleTrips = try await ApiController.shared.getPossibleTrains(from: firstStation.code, to: secondStation.code)
                let trip = Trip(id: UUID(), name: "Home", possibleTrains: possibleTrips, startPoint: firstStation, endPoint: secondStation)
                print(trip)
            }
        }
    }
}



