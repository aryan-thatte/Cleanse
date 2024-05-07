//
//  Validate Credentials.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2024-04-22.
//

import Foundation

func credsValid(u: String, p: String, c: String) -> String {
    // check for empty fields
    if (u.isEmpty || p.isEmpty || c.isEmpty) {
        print("empty")
        return "empty"
    }
    
    // validate email field
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    if (emailPred.evaluate(with: u) == false) {
        print("invalid email")
        return "invalid email"
    }
    
    // validate password: 6 <= len <= 15, 1 upper, 1 lower, 1 num, 1 special char
    let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,15}$"
    let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
    if (passwordPred.evaluate(with: p) == false) {
        print("invalid password")
        return "invalid password"
    }
    
    
    // check if password inputted correctly for both fields
    if (p != c) {
        print("passwords don't match")
        return "passwords don't match"
    }
    
    print("valid")
    return "valid"
}
