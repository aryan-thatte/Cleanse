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
    @EnvironmentObject var sb: Supabase
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Email", text: $username)
            SecureField("Password", text: $password)
        }
        Button("Submit") {
            Task {
                await sb.signUp(username: username, password: password)
                print("Signed up with \(username)")
            }
            dismiss()
        }
            .disabled(username.isEmpty || password.isEmpty)

    }
}


#Preview {
    LoginView()
        .environmentObject(Supabase.shared)
}
