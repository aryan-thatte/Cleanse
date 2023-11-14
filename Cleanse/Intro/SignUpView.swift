//
//  SignUpView.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-13.
//

import Foundation
import SwiftUI
import Supabase

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    var sb: SupabaseClient = SupabaseClient(supabaseURL: Constants.sbURL, supabaseKey: Constants.sbKey)
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Email", text: $username)
            SecureField("Password", text: $password)
        }
        Button("Submit") {
            print("username: \(username)")
            print("password: \(password)")
            Task {
                do {
                    try await sb.auth.signUp(email: username, password: password)
                    try await sb.auth.signIn(email: username, password: password)
                    print(try await sb.auth.session)
                } catch {
                    print(error)
                }
            }
            dismiss()
        }
        .disabled(username.isEmpty || password.isEmpty)

    }
}
