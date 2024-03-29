//
//  CardWidgetView.swift
//  tracks
//
//  Created by Alessandro Vinaccia on 08/03/23.
//
import SwiftUI
import Foundation

struct CardWidgetView: View {
    //EXAMPLE
//    @Binding
    var trip : Trip
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24, style: .continuous).fill(.white)
                .shadow(radius: 10)
                .frame(width: 329, height: 155)
            VStack(alignment: .leading){
                HStack{
                    Text("\(Image(systemName: trip.iconName)) \(trip.name)" )
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .bold()
                        .padding(.leading)
                    Spacer()
                    Menu{
                        Button {
                            print("Change country setting")
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }

                        Button {
                            print("try delete trip")
                            Task{
                                do{
                                    try await TripViewModel.shared.deleteTrip(id: trip.id)
                                }catch{
                                   print("error deleting trip")
                                }
                            }
                        } label: {
                            Label("Delete Trip", systemImage: "trash.fill").accentColor(.red)
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(Color(.darkGray))
                    }
                    .padding(.trailing)
                    
//                    Text(Image(systemName: "ellipsis.circle"))
//                        .foregroundColor(Color(.darkGray))
//                        .padding(.trailing)
//                        .contextMenu {
//                            Button {
//                                print("Change country setting")
//                            } label: {
//                                Label("Edit", systemImage: "pencil")
//                            }
//
//                            Button {
//                                print("delete trip")
//                            } label: {
//                                Label("Delete Trip", systemImage: "location.circle").accentColor(.red)
//                            }
//                        }
                }.padding(.top)
                    
                
                (Text("\(trip.startPoint.name)") + Text(Image(systemName: "arrow.right")) + Text(trip.endPoint.name))
                    .font(.system(size: 14)).foregroundColor(Color.black)
                    .padding(.leading)
                    .padding(.trailing)
                
                HStack{
                    ZStack{
                        HStack{
                            Text("\(trip.nextArrivals[0]) mins")
                                .padding(4)
                                
                            Text(trip.possibleTrains.isEmpty ? ("-") : trip.possibleTrains[0].track)
                                .fontWeight(.semibold)
                                .padding(5)
                                .background(Color("Binario"))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }.padding(6)
                            .background(Color("Tuorlo"))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    }
                    .padding(5)
                    
                    Image(systemName: "arrow.right")
                    //Image(systemName: "greaterthan")
                    //Image(systemName: "greaterthan")
                    
                    ZStack{
                        HStack{
                            Text("\(trip.nextArrivals[1]) mins")
                                .padding(4)
                                
                            Text(trip.possibleTrains.isEmpty ? ("-") : trip.possibleTrains[1].track)
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
