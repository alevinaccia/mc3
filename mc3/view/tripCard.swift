//
//  tripCard.swift
//  mc3
//
//  Created by Alessandro Vinaccia on 21/02/23.
//

import SwiftUI

struct tripCard: View {
    let trip : TrainStatus = TrainStatus(departStation: "NAPOLI CAMPI FLEGREI", arrivalStation: "SALERNO", stationLastUpdate: "--", trainNumber: 21319, delay: 0, stops: [Stop(station: "NAPOLI CAMPI FLEGREI", departTime: "11:32", stationCode: "S09103"), Stop(station: "NAPOLI PIAZZA LEOPARDI", departTime: "11:34", stationCode: "S09104"), Stop(station: "NAPOLI MERGELLINA", departTime: "11:38", stationCode: "S09105"), Stop(station: "PIAZZA AMEDEO", departTime: "11:42", stationCode: "S09106"), Stop(station: "NAPOLI MONTESANTO", departTime: "11:46", stationCode: "S09107"), Stop(station: "PIAZZA CAVOUR", departTime: "11:50", stationCode: "S09108"), Stop(station: "NAPOLI PIAZZA GARIBALDI", departTime: "11:56", stationCode: "S09109"), Stop(station: "NAPOLI GIANTURCO", departTime: "12:02", stationCode: "S09110"), Stop(station: "NAPOLI S.GIOV.BARRA", departTime: "12:08", stationCode: "S09800"), Stop(station: "PIETRARSA", departTime: "12:12", stationCode: "S09801"), Stop(station: "PORTICI- ERCOLANO", departTime: "12:16", stationCode: "S09802"), Stop(station: "TORRE DEL GRECO", departTime: "12:20", stationCode: "S09803"), Stop(station: "S.MARIA LA BRUNA", departTime: "12:25", stationCode: "S09804"), Stop(station: "TORRE ANNUNZIATA CENTRALE", departTime: "12:29", stationCode: "S09806"), Stop(station: "POMPEI", departTime: "12:34", stationCode: "S09810"), Stop(station: "SCAFATI", departTime: "12:38", stationCode: "S09811"), Stop(station: "ANGRI", departTime: "12:42", stationCode: "S09812"), Stop(station: "PAGANI", departTime: "12:46", stationCode: "S09813"), Stop(station: "NOCERA INFERIORE", departTime: "12:49", stationCode: "S09814"), Stop(station: "NOCERA SUPERIORE", departTime: "12:54", stationCode: "S09815"), Stop(station: "CAVA DEI TIRRENI", departTime: "13:00", stationCode: "S09816"), Stop(station: "VIETRI SUL MARE", departTime: "13:05", stationCode: "S09817"), Stop(station: "DUOMO VIA VERNIERI", departTime: "13:10", stationCode: "S09819"), Stop(station: "SALERNO", departTime: "13:20", stationCode: "S09818")], departed: false, departTime: "11:32")
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20).frame(width: 330, height: 155).shadow(radius: 10).foregroundColor(.white).zIndex(0)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Test")
                        Text("\(trip.departStation)-\(trip.arrivalStation)").font(.system(size : 12))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius : 10).frame(width: 26, height: 34).foregroundColor(.purple)
                        Text("-").font(.system(size : 16)).foregroundColor(.white)
                    }
                }
                
            }
        }
    }
}

struct tripCard_Previews: PreviewProvider {
    static var previews: some View {
        tripCard()
    }
}
