import SwiftUI

struct searchTrip: View {
    
    @Binding var firstStation : Station
    @Binding var secondStation : Station

    @State var searchResult : [Substring] = []
    @Binding var possibleTrips : [TrainStatus]
    
    @State var selectedFirstBar : Bool = false
    @State var selectedSecondBar : Bool = false
    @State var startingPoint : String = "Stazione di partenza"
    @State var endingPoint : String = "Stazione di arrivo"
    
    @Binding var tagName: String
    @Binding var iconName: String
    
    @Binding var flagTextField1 : Bool
    @Binding var flagTextField2 : Bool
    @Binding var flagWaitResults : Bool
    
    @State var queryRequestStart : String = ""
    @State var queryRequestEnd : String = ""
    
    var body: some View {
        
        VStack {
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
                                flagTextField1 = true
                            }else if (selectedSecondBar == true){
                                let format = res.split(separator: "|")
                                secondStation.name = String(format[0])
                                secondStation.code = String(format[1])
                                queryRequestEnd = ""
                                endingPoint = secondStation.name
                                flagTextField2 = true
                            }
                        } label: {
                            Text(res)
                        }
                    }
                }
                .listStyle(.inset)
                .padding()
                .frame(width: 329, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("Notte"), lineWidth: 4)
                )
                .transition(.slide)
            }
            else{
                VStack{
                    if(flagTextField1 == false || flagTextField2 == false){
                        Text("in attesa di inserimento")
                    }else if(flagWaitResults == true){
                        Text("Loading...")
                        ProgressView()
                    }
                    else if (!possibleTrips.isEmpty) {
                        //ci sono delle tratte tra le due selezionate
                        VStack{
                            Text("Ci sono delle tratte!") + Text(Image(systemName: "checkmark.seal.fill"))
                        }
                    } else {
                        //non ci sono delle tratte
                        VStack{
                            Text("Non ci sono delle tratte!")
                        }
                    }
                }                .padding()
                    .frame(width: 329, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("Notte"), lineWidth: 4)
                    )
            }
            iconSelector(tagName: $tagName, iconName: $iconName)//.padding(.top)

        }
        .padding(.top)
        .onChange(of: secondStation.name) { newValue in
            Task {
                flagWaitResults = true
                possibleTrips = try await ApiController.shared.getPossibleTrains(from: firstStation.code, to: secondStation.code)
                flagWaitResults = false
                
            }
        }
    }
}



