//
//  ContentView.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-04.
//

import SwiftUI
import Supabase

struct ContentView: View {
    @EnvironmentObject var sb: Supabase
    
    var body: some View {
        Group {
            if Supabase.shared.authenticated {
                CleanseListView()
            } else {
                LoginView()
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(Supabase.shared)
}
