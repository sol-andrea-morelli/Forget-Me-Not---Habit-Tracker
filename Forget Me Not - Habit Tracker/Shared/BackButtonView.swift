//
//  BackButtonView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("< Back") { dismiss() }
            .foregroundStyle(.black)
            .font(.custom("Gaegu-Bold", size: 18))
            .accessibilityLabel("Go back")
    }
}
