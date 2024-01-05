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
    @EnvironmentObject var sb: Supabase
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Email", text: $username)
                .foregroundColor(Palette.white)
            SecureField("Password", text: $password)
                .foregroundColor(Palette.white)
            
            Button("Submit") {
                Task {
                    await sb.signIn(username: username, password: password)
                    print("Signed into \(username)")
                }
                dismiss()
            }
                .foregroundColor(username.isEmpty || password.isEmpty ? Color.gray : Color.blue)
                .disabled(username.isEmpty || password.isEmpty)
        }

    }
}

#Preview {
    LoginView()
}
