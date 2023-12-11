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
                await Supabase().signOut()
                print("Signed out")
            }
        }
            .frame(width: 100, height: 100)
            .font(.title)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
        
        Button("Joining Cleanse") {
            Task {
                print(await Supabase().getUser()?.email as Any)
                print(await Supabase().deleteCleanse(code: UUID(uuidString: "c79c6395-ca2d-4a15-82d3-2b6f77a30aad")!))
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
    WelcomeView()
}
