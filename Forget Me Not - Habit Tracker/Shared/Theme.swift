//
//  Theme.swift
//  HabitTracker
//
//  Created by Sol Morelli on 24/04/2024.
//

import SwiftUI

class Theme {
    static let background = Color(red: 0.949, green: 0.929, blue: 0.906)
    
    static let colors: [Color] = [
        Color(red: 0.922, green: 0.749, blue: 0.38), // yellow
        Color(red: 0.941, green: 0.6, blue: 0.424), // orange
        Color(red: 0.949, green: 0.412, blue: 0.584), // pink
        Color(red: 0.51, green: 0.522, blue: 0.69), // dark blue
        Color(red: 0.639, green: 0.635, blue: 0.918), // light purple
        Color(red: 0.655, green: 0.765, blue: 0.851), // light blue
        Color(red: 0.302, green: 0.659, blue: 0.616), // light green
        Color(red: 0.459, green: 0.678, blue: 0.443) // green
    ]
    
    static let colorNames = [
        0: LocalizedStringKey("Yellow"),
        1: LocalizedStringKey("Orange"),
        2: LocalizedStringKey("Pink"),
        3: LocalizedStringKey("Dark blue"),
        4: LocalizedStringKey("Light purple"),
        5: LocalizedStringKey("Light blue"),
        6: LocalizedStringKey("Light green"),
        7: LocalizedStringKey("Green")
    ]
    
    static func colorName(index: Int) -> LocalizedStringKey {
        colorNames[index] ?? LocalizedStringKey("Unknown")
    }
    
    static func color(index: Int) -> Color {
        colors[index]
    }
}
