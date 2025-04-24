//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/19/25.
//

import SwiftUI

struct NewHabitView: View {
    
    var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    @State private var showingValidationAlert = false
    
    @Environment(\.dismiss) var bye
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Exercise", text: $title)
                }
                Section("Description") {
                    TextEditor(text: $description)
                }
                Section {
                    Button("Create New Habit") {
                        createNewHabit()
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.clear)
                .alert("Enter a title", isPresented: $showingValidationAlert) {
                    Button("OK") { }
                } message: {
                    Text("Enter a title for your new habit.")
                }
            }
            .navigationTitle("New Habit")
        }
    }
    
    private func createNewHabit() {
        if title.trimmingCharacters(in: .whitespaces).isEmpty {
            showingValidationAlert = true
        } else {
            let habit = Habit(
                title: title.trimmingCharacters(in: .whitespacesAndNewlines),
                description: description.trimmingCharacters(in: .whitespacesAndNewlines)
            )
            habits.habits.append(habit)
            bye()
        }
    }
}

#Preview {
    let habits = Habits()
    NewHabitView(habits: habits)
}
