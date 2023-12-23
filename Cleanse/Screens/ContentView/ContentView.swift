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
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if sb.authenticated {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}


#Preview {
    ContentView()
}
