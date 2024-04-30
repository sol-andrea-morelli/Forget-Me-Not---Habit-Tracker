//
//  ContentView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 21/04/2024.
//

// TODO: Better architecture
// TODO: Documentation?
// TODO: Fancier stress tests only available on debug?
// TODO: Automated tests?

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack { 
                Theme.background.ignoresSafeArea()
                VStack {
                    HabitListView()
                    .toolbar {
                        NavigationLink(destination: ManageHabitsView()) {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(.black)
                                .accessibilityLabel("Manage habits")
                        }
                    }
                }
                .frame(maxWidth: 1080)
            }
            .frame(maxWidth: .infinity)
        }
        .font(.custom("Gaegu-Regular", size: 18))
        .preferredColorScheme(.light)
    }
}

#Preview {
    do {
        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer =  try ModelContainer(for: Habit.self, configurations: modelConfiguration)
        return ContentView()
            .modelContainer(modelContainer)
    } catch {
        return Text("Failed to create model container for SwiftData")
    }
}
