//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/21/25.
//

import SwiftUI

struct HabitDetailView: View {
    
    let habit: Habit
    
    var body: some View {
        //NavigationStack {
            VStack {
                if (habit.description.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                    Text(habit.description)
                }
            }
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            //.padding()
            //.navigationTitle(habit.title)
        //}
    }
}

#Preview {
    let habit = Habit(title: "Test Habit", description: "Desc")
    HabitDetailView(habit: habit)
}
