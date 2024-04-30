//
//  SectionTitleView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct ManageHabitsSectionTitleView: View {
    let title: LocalizedStringKey
    let sectionIsEmpty: Bool
    
    var body: some View {
        HStack {
            Text(sectionIsEmpty ? "-- No " : "-- ")
                .textCase(nil)
            Text(title)
                .textCase(sectionIsEmpty ? .lowercase : nil)
            Text("-- ")
        }
        .accessibilityElement(children: .combine)
        .frame(maxWidth: .infinity, alignment: .center)
        .font(.custom("Gaegu-Regular", size: 16))
        .textCase(.uppercase)
    }
    
    init(_ title: LocalizedStringKey, sectionIsEmpty: Bool) {
        self.title = title
        self.sectionIsEmpty = sectionIsEmpty
    }
}
