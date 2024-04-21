//
//  Haptics.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2024-04-21.
//

import Foundation
import SwiftUI

struct Haptics {
    static var shared: Haptics = Haptics() // singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
