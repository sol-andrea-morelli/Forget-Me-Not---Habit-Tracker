//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftData
import SwiftUI

struct HabitListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var shownDate = ShownDate.shared
    @Query var habits: [Habit]
    
    var columns: [GridItem] {
        Array(
            repeating: GridItem(.flexible(minimum: 32)),
            count: horizontalSizeClass == .compact ? 8 : 16
        )
    }
    
    var body: some View {
        ScrollView {
            Text("Habit tracker")
                .font(.custom("Gaegu-Bold", size: 42, relativeTo: .title))
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
            ForEach(habits.filter { $0.visible }) { habit in
                HStack {
                    HabitNameView(title: "\(habit.name)")
                    LazyVGrid(columns: columns) {
                        ForEach(1..<shownDate.daysinShownMonth + 1, id: \.self) { day in
                            Button {
                                habit.toggle(year: shownDate.year, month: shownDate.month, day: day)
                            } label: {
                                DayView(number: day, habit: habit)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
            if habits.filter({ $0.visible }).isEmpty {
                Text("No habits to show")
                    .frame(maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Theme.background)
    }
}
