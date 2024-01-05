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
    @State private var animateGradient = false
    
    var body: some View {
        Group {
            if Supabase.shared.authenticated {
                HomeView()
//                    .background(
//                        LinearGradient(colors: [Palette.sky, Palette.navy], startPoint: .topLeading, endPoint: .bottomTrailing)
//                            .hueRotation(animateGradient ? .degrees(98) : .degrees(0))
//                            .ignoresSafeArea()
//                            .onAppear {
//                                withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: true)) {
//                                    animateGradient = true
//                                }
//                            }
//                    )
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
