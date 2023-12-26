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
    
    var body: some View {
        ZStack {
            Palette.navy.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Spacer()
                
                Text("Cleanse")
                    .font(.largeTitle)
                    .padding()
                
                
                Text("It's time to reset")
                    .font(.headline)
                
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
                    .foregroundColor(Palette.black)
                    .background(Palette.green)
                    .cornerRadius(10)
                    
                    Button("Sign In") {
                        signIn.toggle()
                    }
                    .sheet(isPresented: $signIn, content: {
                        SignInView()
                    })
                    .frame(width: 150, height: 60)
                    .font(.title)
                    .foregroundColor(Palette.black)
                    .background(Palette.green)
                    .cornerRadius(10)
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
