import SwiftUI
import Foundation

struct CardViewEmpty: View {
    //EXAMPLE
    let card = Trip(id: UUID(), name: "Home", possibleTrips: [TrainStatus(departStation: "NAPOLI S.GIOV.BARRA", arrivalStation: "POZZUOLI SOLFATARA", trainNumber: 20948, delay: 0, stops: [mc3.Stop(station: "NAPOLI S.GIOV.BARRA", departTime: "13:43", stationCode: "S09800"), Stop(station: "NAPOLI GIANTURCO", departTime: "13:51", stationCode: "S09110"), Stop(station: "NAPOLI PIAZZA GARIBALDI", departTime: "13:55", stationCode: "S09109"), Stop(station: "PIAZZA CAVOUR", departTime: "14:01", stationCode: "S09108"), Stop(station: "NAPOLI MONTESANTO", departTime: "14:04", stationCode: "S09107"), Stop(station: "PIAZZA AMEDEO", departTime: "14:07", stationCode: "S09106"), Stop(station: "NAPOLI MERGELLINA", departTime: "14:12", stationCode: "S09105"), Stop(station: "NAPOLI PIAZZA LEOPARDI", departTime: "14:16", stationCode: "S09104"), Stop(station: "NAPOLI CAMPI FLEGREI", departTime: "14:21", stationCode: "S09103"), Stop(station: "CAVALLEGGERI AOSTA", departTime: "14:25", stationCode: "S09113"), Stop(station: "BAGNOLI AGNANO TERME", departTime: "14:29", stationCode: "S09102"), Stop(station: "POZZUOLI SOLFATARA", departTime: "14:36", stationCode: "S09101")], departed: false, interestedStation: "S09800")]
, startPoint: "startPoint", endPoint: "endPoint")
    
    var body: some View {
            
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 24, style: .continuous).fill(.white)
                    .shadow(radius: 10)
                    .frame(width: 329, height: 155)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("")
                            .frame(width: 60, height: 16)
                            .background(Color(.gray))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .bold()
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "ellipsis.circle").foregroundColor(Color(.darkGray))
                            .padding(.trailing)
                    }.padding(.top)
                    
                    Text("").font(.system(size: 14)).foregroundColor(Color.black).frame(width: 80, height: 14)
                        .background(Color(.lightGray))
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .padding(.leading)
                        .padding(.top,-2)
                    
                    HStack{
                        ZStack{
                            HStack{
                                Text("      ")
                                    .padding(4)
                                
                                Text("  ")
                                    .fontWeight(.semibold)
                                    .padding(5)
                                    .background(Color(.gray))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }.padding(6)
                                .background(Color(.lightGray))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        }.padding(5)
                        
                        Image(systemName: "arrow.right").foregroundColor(.gray)
                        //Image(systemName: "greaterthan").foregroundColor(.gray)
                        //Image(systemName: "greaterthan").foregroundColor(.gray)
                        
                        ZStack{
                            HStack{
                                Text("      ")
                                    .padding(4)
                                
                                Text("  ")
                                    .fontWeight(.semibold)
                                    .padding(5)
                                    .background(Color(.gray))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }.padding(6)
                                .background(Color(.lightGray))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        }.padding(5)
                        
                    }.padding(.leading)
                        .padding(.top, 2)
                    
                    
                    
                    Spacer()
                    ZStack{
                        Rectangle()
                            .frame(width: 329, height: 45)
                        
                            .foregroundColor(Color(.darkGray))
                            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        
                        HStack {
                            Text("You’ll arrive at the station in:")
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            Text("      \(Image(systemName: "figure.walk"))")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                    }
                }.opacity(0.5)
                Button {
                    print("add")
                } label: {
                    Text("\(Image(systemName: "plus.circle"))" )
                        .foregroundColor(Color(.black))
                        .font(.system(size: 60)
                            .bold())
                }
            }
            .frame(width: 329, height: 155)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardViewEmpty()
    }
}




