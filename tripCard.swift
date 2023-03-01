import SwiftUI
import Foundation

struct CardView: View {
    //EXAMPLE
    let trip : Trip
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24, style: .continuous).fill(.white)
                .shadow(radius: 10)
                .frame(width: 329, height: 155)
            VStack(alignment: .leading){
                HStack{
                    Text("\(Image(systemName: "house")) \(trip.name)" )
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
                
                Text("\(trip.startPoint.name + " Arrive " + trip.endPoint.name)").font(.system(size: 14)).foregroundColor(Color.black)
                    .padding(.leading)
                
                HStack{
                    ZStack{
                        HStack{
                            Text("\(trip.nextArrivals[0]) mins")
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
                            Text("\(trip.nextArrivals[1]) mins")
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
