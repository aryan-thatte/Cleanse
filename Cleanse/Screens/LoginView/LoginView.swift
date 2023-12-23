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
        
        Text("Cleanse")
        
        Text("Welcome to a new beginning 😌")
                
        Button("Sign In") {
            signIn.toggle()
        }
            .sheet(isPresented: $signIn, content: {
                SignInView()
                    .presentationDetents([.height(300)])
            })
            .frame(width: 100, height: 100)
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
        
        Button("Sign Out") {
            Task {
                await sb.signOut()
                print("Signed out")
            }
        }
            .frame(width: 100, height: 100)
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
        
        Button("Get User") {
            Task {
                let user = await sb.getUser()
                print(user as Any)
            }
        }
            .frame(width: 100, height: 100)
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)

    }
}

#Preview {
    LoginView()
}
