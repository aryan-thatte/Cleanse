//
//  SignInView.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-13.
//

import Foundation
import SwiftUI
import Supabase

struct SignInView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    var sb: SupabaseClient = SupabaseClient(supabaseURL: Constants.sbURL, supabaseKey: Constants.sbKey)
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Email", text: $username)
            SecureField("Password", text: $password)
            
            Button("Submit") {
                print("username: \(username)")
                print("password: \(password)")
                dismiss()
//                Task {
//                    var res = try await sb.auth.signIn(
//                        email: username,
//                        password: password)
//                }
            }
            .foregroundColor(username.isEmpty || password.isEmpty ? Color.gray : Color.blue)
            .disabled(username.isEmpty || password.isEmpty)
        }

    }
}
