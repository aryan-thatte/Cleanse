//
//  ContentView.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-04.
//

import SwiftUI
import SwiftData
import Supabase

struct ContentView: View {
    let sb: Supabase = Supabase()
    var loggedIn: Bool
    
    init() {
//        loggedIn = await sb.loggedin()
        loggedIn = true
    }
    
    var body: some View {
        loggedIn ? WelcomeView() : WelcomeView()
    }
}


#Preview {
    ContentView()
}
