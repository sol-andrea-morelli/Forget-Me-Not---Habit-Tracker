//
//  EditHabitView.swift
//  HabitTracker
//
//  Created by Sol Morelli on 27/04/2024.
//

import SwiftUI

struct EditHabitView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @FocusState var editingName
    
    @State private var name: String
    @State private var showingDeleteAlert = false
    
    let habit: Habit
    
    var body: some View {
        Form {
            Section {
                HStack {
                    TextField("", text: $name)
                        .focused($editingName)
                        .accessibilityLabel("Habit name:")
                    Image(systemName: "pencil")
                        .onTapGesture { editingName = true }
                        .accessibilityHidden(true)
                }
                
                FormButtonView("Habit visibility:", action: habit.toggleVisibility) {
                    Group {
                        Text(habit.visible ? "Visible" : "Hidden")
                        Image(systemName: habit.visible ? "eye.fill" : "eye.slash")
                    }
                    .foregroundStyle(habit.visible ? .black : .gray)
                }
                
                FormButtonView("Habit color:", action: habit.switchColor) {
                    Group {
                        Text(Theme.colorName(index: habit.color))
                        Image(systemName: "app.fill")
                            .accessibilityHidden(true)
                    }
                    .foregroundStyle(Theme.color(index: habit.color))
                }
            }
            
            Button("Delete habit", role: .destructive) { showingDeleteAlert = true }
                .frame(maxWidth: .infinity)
                .font(.custom("Gaegu-Bold", size: 18))
                .alert("Delete \"\(habit.name)\"?", isPresented: $showingDeleteAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Delete", role: .destructive) { 
                        modelContext.delete(habit)
                        dismiss()
                    }
                } message: {
                    Text("Deleting this habit will also delete all its completion history. Are you sure?")
                }
        }
        .toolbar {
            if editingName {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Cancel") {
                        editingName = false
                        name = habit.name
                    }
                    Spacer()
                    Button("Done") {
                        editingName = false
                        habit.updateName(name)
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Theme.background)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView())
    }
    
    init(habit: Habit) {
        self.habit = habit
        self._name = State(initialValue: habit.name)
    }
}
