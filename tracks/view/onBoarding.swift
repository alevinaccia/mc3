//
//  Onboarding.swift
//  mc3
//
//  Created by Valerio Mosca on 01/03/23.
//

import Foundation
import SwiftUI

//onboarding

struct onboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    var body: some View {
        TabView {
            //PRIMA PAGINA
            firstView()
            //SECONDA PAGINA
            //secondView()
            //TERZA PAGINA
            thirdView()
            //QUARTA PAGINA
            lastPageView (
//                text1: "Are you ready?",
//                text2: "Start by adding your train routes.",
                showDismissButton: true,
                shouldShowOnboarding: $shouldShowOnboarding)
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle())
    }
}

struct lastPageView: View {
    let text1: String = "Are you ready?"
    let text2: String = "Start by adding your train routes."
    let showDismissButton: Bool
    
    @Binding var shouldShowOnboarding: Bool
    
    let backgroundImage = Image("Onboarding3")
    var body: some View {
        ZStack{
            backgroundImage.resizable()
                .scaledToFill()
            VStack {
                Spacer()
                VStack{
                    Text (text1)
                        .font(.headline)
                    
                    Text (text2)
                        .font(.headline)
                        .padding()
                }.padding(.bottom,150)
                
                if showDismissButton {
                    Button (action: {
                        shouldShowOnboarding.toggle()
                    },
                            label: {
                        Text ("Get Started")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color("Notte"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                        
                    }).padding(.top, 64)
                        .padding(.bottom, 100)
                }
                
            }
        }.ignoresSafeArea()
    }
}

