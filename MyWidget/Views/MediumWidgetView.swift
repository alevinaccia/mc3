import SwiftUI

struct MediumWidgetView : View {
//var entry: SimpleEntry

//EXAMPLE
    let card : Trip
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
                        
                        Text("\(card.startPoint.name) Arrive \(card.endPoint.name)").font(.system(size: 14)).foregroundColor(Color.black)
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
