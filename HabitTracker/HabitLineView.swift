//
//  HabitLineView.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/23/25.
//

import SwiftUI

struct HabitLineView: View {
    
    var habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.title)
                .font(.headline)
            HStack {
                Text("Times: \(habit.trackCount)")
                Text("Streak: \(habit.trackCount)")
            }
        }
    }
}

#Preview {
    HabitLineView(habit: {
        var habit: Habit = Habit(title: "title", description: "description of habit")
        habit.addToTrack(date: Date.now)
        habit.addToTrack(date: Date.now)
        habit.addToTrack(date: Date.now)
        return habit
    }())
}
