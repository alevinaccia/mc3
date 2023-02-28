import SwiftUI
import Foundation

struct CardViewEmpty: View {

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




