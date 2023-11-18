//
//  SupabaseClient.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-18.
//

import Foundation
import Supabase

struct Supabase {
    private static let sbURL = URL(string: ProcessInfo.processInfo.environment["supabaseURL"]!)!
    private static let sbKey: String = ProcessInfo.processInfo.environment["supabaseKey"]!
    private var sb: SupabaseClient = SupabaseClient(supabaseURL: sbURL, supabaseKey: sbKey)
    
    func signUp(username: String, password: String) async -> Void {
        do {
            try await sb.auth.signUp(email: username, password: password)
        } catch {
            print(error)
        }
    }
    
    func signIn(username: String, password: String) async -> Void {
        do {
            try await sb.auth.signIn(email: username, password: password)
        } catch {
            print(error)
        }
    }
    
    func signOut() async -> Void {
        do {
            try await sb.auth.signOut()
        } catch {
            print(error)
        }
    }
    
    func loggedin() async -> Bool {
        do {
            let _ = try await sb.auth.session
            return true
        } catch {
            print(error)
            return false
        }
    }
}
