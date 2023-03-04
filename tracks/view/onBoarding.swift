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
            firstView(showDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding)
            //SECONDA PAGINA
            secondView(showDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding)
            //TERZA PAGINA
            
            //QUARTA PAGINA
            PageView (
                title: "Hi! I’m Mhera!",
                subtitle: "I’m your virtual friend. I’ll help you keep track of your feelings and learning new things about mental health!",
                imageName: "3",
                showDismissButton: true,
                shouldShowOnboarding: $shouldShowOnboarding)
            
            
        }
        .frame(height: 700)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle())
    }
}

struct PageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let showDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    
    var body: some View{
        VStack {
        Image (imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding()
        Text (title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
    
        Text (subtitle)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color(.secondaryLabel))
            
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
                    
                })
            }
        
        }
    }
}

