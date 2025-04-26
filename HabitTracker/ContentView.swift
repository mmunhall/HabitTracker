//
//  ContentView.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var habits = Habits()
    @State private var showingNewHabitView = false
    
    var body: some View {
        NavigationStack {
            
            if habits.habits.isEmpty {
                Spacer()
                Spacer()
                Text("Track a new habit by tapping the plus button.")
            }
            
            List {
                ForEach(habits.habits) { habit in
                    NavigationLink(value: habit) {
                        HabitLineView(habit: habit)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            trackHabit(habit: habit)
                        } label: {
                            Label("I did this today", systemImage: "figure.run")
                        }
                        .tint(.green)
                    }
                }
                .onDelete(perform: deleteHabit)
            }
            .navigationTitle("Habits")
            .navigationDestination(for: Habit.self) { selection in
                HabitDetailView(habit: selection)
            }
            .sheet(isPresented: $showingNewHabitView) {
                NewHabitView(habits: habits)
            }
            .toolbar {
                Button {
                    showingNewHabitView = true
                } label: {
                    Label("Track new habit", systemImage: "plus")
                }
            }
        }
    }
    
    func trackHabit(habit: Habit) {
        var habitCopy = habit
        if habitCopy.track.contains(Date.now) {
            habitCopy.removeFromTrack(Date.now)
        } else {
            habitCopy.addToTrack()
        }
        let index = habits.habits.firstIndex(where: {$0.id == habit.id})
        habits.habits[index!] = habitCopy
    }
    
    func deleteHabit(at offsets: IndexSet) {
        
    }
}

#Preview {
    ContentView()
}
