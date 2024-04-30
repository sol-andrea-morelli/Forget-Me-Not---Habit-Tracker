//
//  FormButtonView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct FormButtonView<Content: View>: View {
    let title: LocalizedStringKey
    let action: () -> Void
    @ViewBuilder let detail: Content
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            detail
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
        .accessibilityHint("Tap to switch between values")
        .contentShape(.rect)
        .onTapGesture { action() }
    }
    
    init(_ title: LocalizedStringKey, action: @escaping () -> Void, @ViewBuilder detail: () -> Content) {
        self.title = title
        self.action = action
        self.detail = detail()
    }
}
