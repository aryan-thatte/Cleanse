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
                    .font(.system(size: 48))
                    .padding()
                    .shadow(radius: 10, y: 15)
                
                
                Text("It's time to reset")
                    .font(.system(size: 20))
                    .shadow(radius: 10, y: 15)
                
                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    Button("Sign Up") {
                        signUp.toggle()
                    }
                    .sheet(isPresented: $signUp, content: {
                        SignUpView()
                    })
                    .frame(width: 150, height: 60)
                    .font(.title)
                    .foregroundColor(Palette.white)
                    .background(Palette.navy)
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
                    
                    Button("Sign In") {
                        signIn.toggle()
                    }
                    .sheet(isPresented: $signIn, content: {
                        SignInView()
                    })
                    .frame(width: 150, height: 60)
                    .font(.title)
                    .foregroundColor(Palette.white)
                    .background(Palette.navy)
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
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
