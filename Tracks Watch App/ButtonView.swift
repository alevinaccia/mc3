//
//  ButtonView.swift
//  Tracks Watch App
//
//  Created by antonia on 28/02/23.
//

import SwiftUI

struct ButtonView: View {
    
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(Image(systemName: imageName))
                .padding(10.0)
                .font(.system(size: 25))
        }
        .background(Color("Tuorlo"))
        .foregroundColor(Color("Notte"))
        .clipShape(Circle())
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(imageName: "briefcase") {}
    }
}
