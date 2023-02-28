
import SwiftUI

struct SmallWidgetView: View {
    var entry: SimpleEntry
    //EXAMPLE
    let card : Trip = Trip(id: UUID(), name: "Home", possibleTrains: [TrainStatus(departStation: "NAPOLI S.GIOV.BARRA", arrivalStation: "POZZUOLI SOLFATARA", trainNumber: 20948, delay: 0, stops: [Stop(station: "NAPOLI S.GIOV.BARRA", departTime: 8, stationCode: "S09800"), Stop(station: "NAPOLI GIANTURCO", departTime: 8, stationCode: "S09110"), Stop(station: "NAPOLI PIAZZA GARIBALDI", departTime: 8, stationCode: "S09109"), Stop(station: "PIAZZA CAVOUR", departTime: 8, stationCode: "S09108"), Stop(station: "NAPOLI MONTESANTO", departTime: 8, stationCode: "S09107"), Stop(station: "PIAZZA AMEDEO", departTime: 8, stationCode: "S09106"), Stop(station: "NAPOLI MERGELLINA", departTime: 8, stationCode: "S09105"), Stop(station: "NAPOLI PIAZZA LEOPARDI", departTime: 8, stationCode: "S09104"), Stop(station: "NAPOLI CAMPI FLEGREI", departTime: 8, stationCode: "S09103"), Stop(station: "CAVALLEGGERI AOSTA", departTime: 8, stationCode: "S09113"), Stop(station: "BAGNOLI AGNANO TERME", departTime: 8, stationCode: "S09102"), Stop(station: "POZZUOLI SOLFATARA", departTime: 8, stationCode: "S09101")], departed: false, time: 12)], startPoint: Station(name: "teet", code: "0505"), endPoint: Station(name: "teet", code: "0505"))
    

        var now = Date.now.formatted()


        var body: some View {
            if now < card.nextArrivals[0]  {
                    Text("\(Image(systemName: "house")) \(card.name)" )
            } else {
                ZStack{
                    RoundedRectangle(cornerRadius: 24, style: .continuous).fill(.white)
                        .shadow(radius: 10)
                        .frame(width: 329, height: 155)
                    VStack(alignment: .leading){
                        HStack{
                            Text("\(Image(systemName: "house")) \(card.name)" )
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .bold()
                                .padding(.leading)
                            Spacer()
                            Text("\(Image(systemName: "ellipsis.circle"))")
                                .padding(.trailing)
                                .contextMenu {
                                    Button {
                                        print("Edit")
                                    } label: {
                                        Label("Choose Country", systemImage: "globe")
                                    }
                                    
                                    Button {
                                        print("Delete")
                                    } label: {
                                        Label("Detect Location", systemImage: "location.circle")
                                    }
                                }
                            
                        }.padding(.top)
                        
                        Text("\(card.startPoint.name) Arrive  \(card.endPoint.name)").font(.system(size: 14)).foregroundColor(Color.black)
                            .padding(.leading)
                        
                        HStack{
                            ZStack{
                                HStack{
                                    Text("7 mins")
                                        .padding(4)
                                    
                                    Text("14")
                                        .fontWeight(.semibold)
                                        .padding(5)
                                        .background(Color("Binario"))
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }.padding(6)
                                    .background(Color("Tuorlo"))
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            }.padding(5)
                            
                            Image(systemName: "greaterthan")
                            Image(systemName: "greaterthan")
                            
                            ZStack{
                                HStack{
                                    Text("9 mins")
                                        .padding(4)
                                    
                                    Text("10")
                                        .fontWeight(.semibold)
                                        .padding(5)
                                        .background(Color("Binario"))
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }.padding(6)
                                    .background(Color("Tuorlo"))
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            }.padding(5)
                            
                        }.padding(.leading)
                        
                        
                        
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 329, height: 45)
                                .background(Color("Notte"))
                            //                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                            
                            HStack {
                                Text("You’ll arrive at the station in:")
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()
                                Text("7mins \(Image(systemName: "figure.walk"))")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            //                    Text("You’ll arrive at the station in")
                            //                        .foregroundColor(.white)
                            //                        .frame(width: 329, height: 45)
                            //                        .background(Color("Notte"))
                            //                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        }
                    }
                }.frame(width: 329, height: 155)
            }
        
    }
}
