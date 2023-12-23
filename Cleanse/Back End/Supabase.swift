//
//  SupabaseClient.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-18.
//

import Foundation
import Supabase
import SwiftUI

class Supabase: ObservableObject {
    // shared environment instance of Supabase class
    static var shared: Supabase = Supabase()
    
    // updated variable which changes based on if user logs in/out
    @Published var authenticated: Bool = false
    
    private static let sbURL = URL(string: ProcessInfo.processInfo.environment["supabaseURL"]!)!
    private static let sbKey: String = ProcessInfo.processInfo.environment["supabaseKey"]!
    var sb: SupabaseClient = SupabaseClient(supabaseURL: sbURL, supabaseKey: sbKey)
    
    func signUp(username: String, password: String) async -> Void {
        do {
            try await sb.auth.signUp(email: username, password: password)
            self.authenticated = true
        } catch {
            print("signUp() failed with the following error: \(error)")
        }
    }
    
    func signIn(username: String, password: String) async -> Void {
        do {
            try await sb.auth.signIn(email: username, password: password)
            self.authenticated = true
        } catch {
            print("signIn() failed with the following error: \(error)")
        }
    }
    
    func signOut() async -> Void {
        do {
            try await sb.auth.signOut()
            self.authenticated = false
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
    
    func fetchUserCleanses() async -> [Cleanse]? {
        do {
            // fetch all Members where the user is the current user
            let user: User? = await getUser()
            let filteredMembers: [Member] = try await sb.database
                .from("members")
                .select()
                .eq(column: "user", value: (user?.id)!)
                .execute()
                .value
            
            // extract the cleanse UUID from each Member
            var cleanseIDs: [UUID] = []
            for member in filteredMembers {
                cleanseIDs.append(member.cleanse)
            }
            
            // fetch all Cleanses with those UUIDs
            var cleanses: [Cleanse] = []
            for cleanseID in cleanseIDs {
                let cleanse: [Cleanse] = try await sb.database
                    .from("cleanses")
                    .select()
                    .eq(column: "id", value: cleanseID)
                    .execute()
                    .value
                print(cleanse[0].id)
                cleanses.append(cleanse[0])
            }
            return cleanses
        } catch {
            print(error)
            return nil
        }
    }
    
    func fetchCleanse(code: UUID) async -> Cleanse? {
        do {
            let cleanse: [Cleanse] = try await sb.database
                .from("cleanses")
                .select()
                .eq(column: "id", value: code)
                .execute()
                .value
            return cleanse[0]
        } catch {
            print("fetchCleanse() failed with the following error: \(error)")
            return nil
        }
    }
    
    func createCleanse(name: String, start: Date, end: Date, penalty: String) async -> Void {
        do {
            // insert into Cleanse table
            let newCleanse: Cleanse = try await sb.database
                .from("cleanses")
                .insert(
                    values: Cleanse(id: UUID(), name: name, start_date: start, end_date: end, penalty: penalty),
                    returning: .representation
                )
                .single()
                .execute()
                .value
            
            // insert into members table
            let user: User? = await getUser()
            let member: Member = Member(id: UUID(), cleanse: newCleanse.id, user: (user?.id)!)
            try await sb.database
                .from("members")
                .insert(values: member)
                .execute()
        } catch {
            print(error)
        }
    }
    
    func deleteCleanse(code: UUID) async -> Void {
        do {
            try await sb.database
                .from("cleanses")
                .delete()
                .eq(column: "id", value: code)
                .execute()
            print("Cleanse was deleted!")
        } catch {
            print(error)
        }
    }
    
    func joinCleanse(code: UUID) async -> String {
        do {
            // check if already exists first
            let user: User? = await getUser()
            let joined: Int? = try await sb.database
                .from("members")
                .select(count: .exact)
                .eq(column: "cleanse", value: code)
                .eq(column: "user", value: (user?.id)!)
                .execute()
                .count
            if (joined == nil) {
                return "Supabase failed to count member instances"
            }
            if (joined! >= 1) {
                return "User is already a part of this Cleanse"
            }
            
            // insert into members table
            let member: Member = Member(id: UUID(), cleanse: code, user: (user?.id)!)
            try await sb.database
                .from("members")
                .insert(values: member)
                .execute()
            return "User was added into the Cleanse"
        } catch {
            return "joinCleanse() failed with the following error: \(error)"
        }
    }
}
