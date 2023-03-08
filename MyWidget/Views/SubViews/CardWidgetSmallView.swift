//
//  CardWidgetSmallView.swift
//  tracks
//
//  Created by Alessandro Vinaccia on 08/03/23.
//

import SwiftUI

struct CardWidgetSmallView: View {
    //var entry: SimpleEntry
    //EXAMPLE
    let card : Trip
        var now = Date.now.formatted()


        var body: some View {
            if now < card.nextArrivals[0]  {
                    RoutesView()
            } else {
                VStack {
                            HStack{
                                Spacer()
                                Image(systemName: "house")
                                Text(card.name)
                                    .fontWeight(.semibold)
                                Spacer()

                            }
                            Spacer()
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 134.0, height: 33.0)
                                    .foregroundColor (Color( "Tuorlo"))
                                Text("5 mins")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("Notte"))


                            }
                            Spacer()
                            Spacer()

                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 134.0, height: 33.0)
                                    .foregroundColor (Color( "Tuorlo"))
                                Text("10 mins")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("Notte"))


                            }
                        Spacer()
                            HStack {

                                Text("300 mt")
                                    .fontWeight(.semibold)
                                Image(systemName: "train.side.front.car")
                            }
                            .padding(.bottom, 20.0)
                            Text("Refreshed at 8:28")
                                .fontWeight(.thin)

                        }
                        .padding()
                        .background(Color("Notte"))
            }
        
    }
}
