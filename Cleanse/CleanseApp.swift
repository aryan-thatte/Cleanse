//
//  CleanseApp.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-04.
//

import SwiftUI
import SwiftData

@main
struct CleanseApp: App {
    @StateObject var sb: Supabase = Supabase.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sb)
        }
    }
}
