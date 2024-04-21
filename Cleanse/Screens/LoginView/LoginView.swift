//
//  Welcome.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-13.
//

import Foundation
import SwiftUI
import Supabase

struct LoginView: View {
    @EnvironmentObject var sb: Supabase
    @State private var signUp: Bool = false
    @State private var signIn: Bool = false
    @State private var animateGradient: Bool = false
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(colors: [Palette.sky, Palette.navy], startPoint: .topLeading, endPoint: .bottomTrailing)
                .hueRotation(animateGradient ? .degrees(98) : .degrees(0))
                .ignoresSafeArea()
                .onAppear {
                    withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: true)) {
                        animateGradient = true
                    }
                }
            
            VStack {
                Spacer()
                
                Text("Cleanse")
                    .font(Fonts.title)
                    .padding()
                    .shadow(radius: 10, y: 15)
                
                
                Text("It's time to reset")
                    .font(Fonts.subtitle2)
                    .shadow(radius: 10, y: 15)
                
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    Button(action: {
                        Haptics.shared.impact(style: .soft)
                        signUp.toggle()
                    }) {
                        Text("Sign Up")
                            .frame(width: 150, height: 60)
                            .font(Fonts.button1)
                            .foregroundColor(Palette.offwhite)
                    }
                    .background(Palette.blue)
                    .cornerRadius(25)
                    .shadow(radius: 10, y: 10)
                    .sheet(isPresented: $signUp) {
                        SignUpView()
                            .presentationDetents([.fraction(0.85)])
                    }
                    
                    Button(action: {
                        Haptics.shared.impact(style: .soft)
                        signIn.toggle()
                    }) {
                        Text("Sign In")
                            .frame(width: 150, height: 60)
                            .font(Fonts.button1)
                            .foregroundColor(Palette.offwhite)
                    }
                    .background(Palette.blue)
                    .cornerRadius(25)
                    .shadow(radius: 10, y: 10)
                    .sheet(isPresented: $signIn) {
                        SignInView()
                            .presentationDetents([.fraction(0.85)])
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(Supabase.shared)
}
