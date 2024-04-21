//
//  Constants.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-23.
//

import Foundation
import SwiftUI

struct Palette {
    static let black = Color(red: 4/255, green: 8/255, blue: 15/255)
    static let grey = Color(red: 32/255, green: 32/255, blue: 32/255)
    static let offwhite = Color(red: 235/255, green: 235/255, blue: 235/255)
    static let white = Color(red: 255/255, green: 255/255, blue: 255/255)
    static let navy = Color(red: 80/255, green: 125/255, blue: 188/255)
    static let blue = Color(red: 110/255, green: 150/255, blue: 210/255)
    static let sky = Color(red: 161/255, green: 198/255, blue: 234/255)
    static let pastel = Color(red: 187/255, green: 209/255, blue: 234/255)
    static let green = Color(red: 206/255, green: 231/255, blue: 216/255)
}

struct Fonts {
    static let title: Font = Font.custom("Arial Rounded MT Bold", size: 48)
    static let subtitle1: Font = Font.custom("Arial Rounded MT Bold", size: 30)
    static let subtitle2: Font = Font.custom("Arial Rounded MT Bold", size: 26)
    static let button1: Font = Font.custom("Arial Rounded MT Bold", size: 28)
    static let text: Font = Font.custom("Arial Rounded MT Bold", size: 22)
}
