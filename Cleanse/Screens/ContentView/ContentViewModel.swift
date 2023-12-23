//
//  ContentViewModel.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-17.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var loggedIn: Bool = false
    
    func getLoggedInStatus() async {
        loggedIn = await Supabase().loggedin()
    }
    
}
