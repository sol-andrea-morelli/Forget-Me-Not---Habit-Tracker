//
//  ManageHabitsRowView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct ManageHabitsRowView: View {
    let habit: Habit
    
    var body: some View {
        HStack {
            Text(habit.name)
            Spacer()
            Text(">")
        }
        .background(
            NavigationLink("", destination: EditHabitView(habit: habit))
                    .opacity(0)
            )
        .accessibilityElement(children: .ignore)
        .accessibilityAddTraits(.isButton)
        .accessibilityLabel(habit.name)
        .accessibilityHint("Tap to edit this habit")
    }
}
