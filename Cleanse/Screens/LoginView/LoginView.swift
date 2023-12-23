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
        VStack {
            Spacer()
            
            Text("Cleanse")
                .font(.largeTitle)
            Text("Welcome to your new beginning 😌")
                .font(.headline)
            
            Spacer()
            
            HStack {
                Button("Sign Up") {
                    signUp.toggle()
                }
                .sheet(isPresented: $signUp, content: {
                    SignUpView()
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
                })
                .frame(width: 100, height: 100)
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Button("Get User") {
                    Task {
                        print(await sb.getUser() as Any)
                    }
                }
                .frame(width: 100, height: 100)
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(Supabase.shared)
}
