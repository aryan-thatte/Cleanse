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
    var sb: SupabaseClient = SupabaseClient(supabaseURL: Constants.sbURL, supabaseKey: Constants.sbKey)
    
    var body: some View {
        WelcomeView()
    }
}

#Preview {
    ContentView()
}
