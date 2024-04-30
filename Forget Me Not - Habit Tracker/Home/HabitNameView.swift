//
//  HabitNameView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct HabitNameView: View {
    let title: String
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var moreSpaceAvailable: Bool {
        horizontalSizeClass == .regular
    }
    
    var body: some View {
        GeometryReader { proxy in
            let dynamicWidth = moreSpaceAvailable ? proxy.size.width : proxy.size.height
            VStack {
                Text(title)
                    .font(.custom("Gaegu-Regular", size: 16))
                    .frame(width: dynamicWidth, height: proxy.size.height)
                    .rotationEffect(moreSpaceAvailable ? .zero : .degrees(-90))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.green.opacity(0.1), lineWidth: 1)
                        )
            }
            .frame(width: proxy.size.width)
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}
