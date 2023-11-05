//
//  Item.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-04.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
