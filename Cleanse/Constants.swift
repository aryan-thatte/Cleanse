//
//  Constants.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-10.
//

import Foundation
import Supabase
import SwiftUI

struct Constants {
    static let sbURL = URL(string: ProcessInfo.processInfo.environment["supabaseURL"]!)!
    static let sbKey: String = ProcessInfo.processInfo.environment["supabaseKey"]!
    
    @AppStorage("userId") static var userId: String = ""
}
