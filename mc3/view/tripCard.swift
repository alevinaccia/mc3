import SwiftUI
import Foundation

struct CardView: View {
    //EXAMPLE
    let card : Trip
    
    var body: some View {
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
                
                Text("\(card.startPoint + " Arrive " + card.endPoint)").font(.system(size: 14)).foregroundColor(Color.black)
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
                    
                    Image(systemName: "arrow.right")
                    //Image(systemName: "greaterthan")
                    //Image(systemName: "greaterthan")
                    
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
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])

                    HStack{
                        Text("You are ")
                                .foregroundColor(.white)
                                .padding(.leading)
                        Text("15 mins")
                                .foregroundColor(Color("Tuorlo"))
                                .bold()
                        Text("away from the station")
                                .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
        }
        .frame(width: 329, height: 155)
    }
}

struct CardViewEmpty_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Trip(id: UUID(), name: "Home", possibleTrips: [TrainStatus(departStation: "NAPOLI S.GIOV.BARRA", arrivalStation: "POZZUOLI SOLFATARA", trainNumber: 20948, delay: 0, stops: [mc3.Stop(station: "NAPOLI S.GIOV.BARRA", departTime: "13:43", stationCode: "S09800"), Stop(station: "NAPOLI GIANTURCO", departTime: "13:51", stationCode: "S09110"), Stop(station: "NAPOLI PIAZZA GARIBALDI", departTime: "13:55", stationCode: "S09109"), Stop(station: "PIAZZA CAVOUR", departTime: "14:01", stationCode: "S09108"), Stop(station: "NAPOLI MONTESANTO", departTime: "14:04", stationCode: "S09107"), Stop(station: "PIAZZA AMEDEO", departTime: "14:07", stationCode: "S09106"), Stop(station: "NAPOLI MERGELLINA", departTime: "14:12", stationCode: "S09105"), Stop(station: "NAPOLI PIAZZA LEOPARDI", departTime: "14:16", stationCode: "S09104"), Stop(station: "NAPOLI CAMPI FLEGREI", departTime: "14:21", stationCode: "S09103"), Stop(station: "CAVALLEGGERI AOSTA", departTime: "14:25", stationCode: "S09113"), Stop(station: "BAGNOLI AGNANO TERME", departTime: "14:29", stationCode: "S09102"), Stop(station: "POZZUOLI SOLFATARA", departTime: "14:36", stationCode: "S09101")], departed: false, interestedStation: "S09800")]
                                    , startPoint: "startPoint", endPoint: "endPoint"))
    }
}




