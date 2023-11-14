//
//  Welcome.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-13.
//

import Foundation
import SwiftUI
import Supabase

struct WelcomeView: View {
    @State private var signUp: Bool = false
    @State private var signIn: Bool = false
    
    var body: some View {
        
        Text("Cleanse")
        
        Text("Welcome to a new beginning 😌")
        
        Button("Sign Up") {
            signUp.toggle()
        }
            .sheet(isPresented: $signUp, content: {
                SignUpView()
                    .presentationDetents([.height(200)])
            })
            .frame(width: 100, height: 100)
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
        
        Button("Sign In") {
            signIn.toggle()
        }
            .sheet(isPresented: $signIn, content: {
                SignInView()
                    .presentationDetents([.height(200)])
            })
            .frame(width: 100, height: 100)
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
