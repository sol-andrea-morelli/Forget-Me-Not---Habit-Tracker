//
//  DateSwitcherView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct JumpToDateButtonView: View {    
    let label: String
    let action: () -> Void
    let accessibilityLabel: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .accessibilityLabel(accessibilityLabel)
                .padding(5)
                .padding(.horizontal)
                .foregroundStyle(.black)
                .background(Theme.background)
                .clipShape(.capsule)
                .font(.custom("Gaegu-Bold", size: 16))
        }
    }
    
    init(_ label: String, accessibilityLabel: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
        self.accessibilityLabel = accessibilityLabel
    }
}
