//
//  ManageHabitListView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftData
import SwiftUI

struct ManageHabitsListView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var habits: [Habit]
    
    var body: some View {
        ZStack(alignment: .top) {
            List {
                Section {
                    ForEach(habits.filter { $0.visible }) { habit in
                        ManageHabitsRowView(habit: habit)
                    }
                } header: {
                    ManageHabitsSectionTitleView("Visible habits", sectionIsEmpty: habits.filter { $0.visible }.isEmpty)
                    #if DEBUG
                        .onTapGesture(count: 2) {
                            for _ in 0..<10 {
                                modelContext.insert(HabitFactory.crearHabito())
                            }
                        }
                    #endif
                }
                Section {
                    ForEach(habits.filter { $0.visible == false }) { habit in
                        ManageHabitsRowView(habit: habit)
                    }
                } header: {
                    ManageHabitsSectionTitleView("Hidden habits", sectionIsEmpty: habits.filter { $0.visible == false }.isEmpty)
                    #if DEBUG
                        .onTapGesture(count: 2) {
                            for habit in habits {
                                modelContext.delete(habit)
                            }
                        }
                    #endif
                }
                Button("+ New Habit") {
                    modelContext.insert(Habit("New habit", color: Int.random(in: 0...7)))
                }
                .frame(maxWidth: .infinity)
                .accessibilityLabel("Create new habit")
                .accessibilityHint("Tap to add a new habit to the bottom of the list")
            }
            .scrollContentBackground(.hidden)
        }
    }
}
