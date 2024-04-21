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
    @State private var confirmpassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create an Account")
                .padding()
                .font(Fonts.subtitle1)
                .background(Color.red)
            
            Spacer()
            
            TextField("Email", text: $username)
                .padding()
                .cornerRadius(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 6)
                .foregroundColor(Palette.white)
            
            SecureField("Password", text: $password)
                .foregroundColor(Palette.white)
            SecureField("Confirm password", text: $confirmpassword)
                .foregroundColor(Palette.white)
            
            Button("Submit") {
                Task {
                    await sb.signUp(username: username, password: password)
                    print("Signed up with \(username)")
                }
                dismiss()
            }
            .foregroundColor(username.isEmpty || password.isEmpty ? Palette.offwhite : Palette.blue)
            .disabled(username.isEmpty || password.isEmpty)
            
            Spacer()
            Spacer()
        }
    }
}


#Preview {
    LoginView()
        .environmentObject(Supabase.shared)
}
