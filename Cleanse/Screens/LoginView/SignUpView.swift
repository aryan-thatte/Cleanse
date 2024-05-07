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
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create an Account")
                .padding()
                .font(Fonts.subtitle1)
            
            Spacer()
            
            TextField("Email", text: $username)
                .padding()
                .cornerRadius(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 6)
            
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 6)
                .foregroundColor(Palette.white)
            
            SecureField("Confirm password", text: $confirmPassword)
                .padding()
                .cornerRadius(10)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.vertical, 6)
                .foregroundColor(Palette.white)
            
            Button(action: {
                Haptics.shared.impact(style: .soft)
                Task {
                    await sb.signUp(username: username, password: password)
                }
                print("Signed up with \(username)")
                dismiss()
            }) {
                Text("Start Cleansing")
                    .frame(width: 150, height: 60)
                    .font(Fonts.button2)
                    .foregroundColor(Palette.offwhite)
            }
            .background(Palette.blue)
            .cornerRadius(25)
            .frame(alignment: .center)
            .shadow(radius: 10, y: 10)
            .foregroundColor(credsValid(u: username, p: password, c: confirmPassword) == "valid" ? Palette.blue : Palette.offwhite)
            .opacity(credsValid(u: username, p: password, c: confirmPassword) == "valid" ? 1 : 0.5)
            .disabled(credsValid(u: username, p: password, c: confirmPassword) != "valid")
            
            Spacer()
            Spacer()
        }
    }
    
    
}


#Preview {
    LoginView()
        .environmentObject(Supabase.shared)
}
