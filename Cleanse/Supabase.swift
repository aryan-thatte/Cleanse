//
//  SupabaseClient.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-18.
//

import Foundation
import Supabase
import SwiftUI

struct Supabase {
    private static let sbURL = URL(string: ProcessInfo.processInfo.environment["supabaseURL"]!)!
    private static let sbKey: String = ProcessInfo.processInfo.environment["supabaseKey"]!
    @AppStorage("EMAIL") var _email: String?
    private var sb: SupabaseClient = SupabaseClient(supabaseURL: sbURL, supabaseKey: sbKey)
    
    func signUp(username: String, password: String) async -> Void {
        do {
            try await sb.auth.signUp(email: username, password: password)
        } catch {
            print("signUp() failed with the following error: \(error)")
        }
    }
    
    func signIn(username: String, password: String) async -> Void {
        do {
            try await sb.auth.signIn(email: username, password: password)
            _email = username
        } catch {
            print("signIn() failed with the following error: \(error)")
        }
    }
    
    func signOut() async -> Void {
        do {
            try await sb.auth.signOut()
            _email = nil
        } catch {
            print("signOut() failed with the following error: \(error)")
        }
    }
    
    func loggedin() async -> Bool {
        do {
            let _ = try await sb.auth.session
            return true
        } catch {
            return false
        }
    }
    
    func getUser() async -> User? {
        do {
            let user = try await sb.auth.session.user
            return user
        } catch {
            print("getUser() failed with the following error: \(error)")
            return nil
        }
    }
    
    func fetchCleanses() {
        
    }
    
    func createCleanse(name: String, start: Date, end: Date, penalty: String) async -> Void {
        do {
            let user: User? = await getUser()
            let newCleanse: Cleanse = try await sb.database
                .from("cleanses")
                .insert(
                    values: Cleanse(id: UUID(), name: name, start_date: start, end_date: end, penalty: penalty),
                    returning: .representation
                )
                .single()
                .execute()
                .value
            let member: Member = Member(id: UUID(), cleanse: newCleanse.id, user: (user?.id)!)
            try await sb.database
                .from("members")
                .insert(values: member)
                .execute()
        } catch {
            print(error)
        }
    }
    
    func joinCleanse(code: String) async -> Void {
         
    }
}
