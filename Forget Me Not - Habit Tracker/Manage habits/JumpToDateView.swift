//
//  JumpToDateView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct JumpToDateView: View {
    @ObservedObject var shownDate = ShownDate.shared
    
    var body: some View {
        VStack {
            Text("Jump to...")
                .font(.custom("Gaegu-Bold", size: 24))
                .accessibilityAddTraits(.isHeader)
            HStack {
                JumpToDateButtonView("<<", accessibilityLabel: "Jump to last month") { shownDate.jumpToLastMonth() }
                Text(shownDate.formattedMonth)
                    .accessibilityLabel("Current month: \(shownDate.formattedMonth)")
                    .frame(minWidth: 100)
                JumpToDateButtonView(">>", accessibilityLabel: "Jump to next month") { shownDate.jumpToNextMonth() }
            }
            HStack {
                JumpToDateButtonView("<<", accessibilityLabel: "Jump to last year") { shownDate.jumpToLastYear() }
                Text(shownDate.formattedYear)
                    .accessibilityLabel("Current year: \(shownDate.formattedYear)")
                    .frame(minWidth: 100)
                JumpToDateButtonView(">>", accessibilityLabel: "Jump to next year") { shownDate.jumpToNextYear() }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
        .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.green.opacity(0.1), lineWidth: 1)
            )
        .padding()
    }
}
