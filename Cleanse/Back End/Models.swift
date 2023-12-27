//
//  Models.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-27.
//

import Foundation

struct Cleanse: Codable, Hashable, Identifiable {
    let id: UUID
    let name: String
    let start_date: Date
    let end_date: Date
    let penalty: String
}

struct Member: Codable, Hashable {
    let id: UUID
    let cleanse: UUID
    let user: UUID
}
