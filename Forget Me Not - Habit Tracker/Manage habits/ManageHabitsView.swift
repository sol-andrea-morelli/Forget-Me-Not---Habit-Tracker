//
//  ManageHabitListView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct ManageHabitsView: View {
    var body: some View {
        VStack {
            JumpToDateView()
            ManageHabitsListView()
        }
        .background(Theme.background)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView())
    }
}
