//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Sol Morelli on 21/04/2024.
//

import SwiftData
import SwiftUI

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
