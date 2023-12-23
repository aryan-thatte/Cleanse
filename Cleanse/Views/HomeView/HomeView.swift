//
//  Home.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-17.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sb: Supabase
    
    var body: some View {
        Text("Home")
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

    }
}

#Preview {
    HomeView()
}
