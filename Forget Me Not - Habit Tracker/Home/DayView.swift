//
//  DayView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct DayView: View {
    @ObservedObject var shownDate = ShownDate.shared
    
    let number: Int
    let isCompleted: Bool
    
    var background: Color {
        isCompleted ? Theme.color(index: habit.color) : .white
    }
    var stroke: Color {
        isCompleted ? .black : Theme.color(index: habit.color)
    }
    var showingCurrentDate: Bool {
        shownDate.isCurrentDate(day: number)
    }

    let habit: Habit
    
    var body: some View {
        Text("\(number)")
            .frame(width: 30, height: 30)
            .background(background)
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.green.opacity(0.1), lineWidth: 1)
                )
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(stroke.opacity(showingCurrentDate ? 1 : 0), lineWidth: 2)
                )
            .accessibilityLabel(showingCurrentDate ? "Today, \(number)th" : "\(number)th")
            .accessibilityHint(isCompleted ? "Tap to mark this day as not completed" : "Tap to mark this day as completed")
    }
    
    init(shownDate: ShownDate = ShownDate.shared, number: Int, habit: Habit) {
        self.shownDate = shownDate
        self.number = number
        self.habit = habit
        self.isCompleted = habit.contains(year: shownDate.year, month: shownDate.month, day: number)
    }
}
