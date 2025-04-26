//
//  HabitLineView.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/23/25.
//

import SwiftUI

struct HabitLineView: View {
    
    var habit: Habit
    @State private var trackedToday: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.title)
                .font(.headline)
            HStack {
                Text("Times: \(habit.trackCount)")
                Text("Streak: \(habit.streak)")
                if (trackedToday) {
                    Text("Today: \(Image(systemName: "figure.run.circle.fill"))")
                } else {
                    Text("Today: \(Image(systemName: "figure.run.circle"))")
                }
            }
            .font(.caption)
        }
    }
    
    init(habit: Habit) {
        self.habit = habit
        self.trackedToday = self.habit.trackedToday
    }
}

#Preview {
    HabitLineView(habit: {
        var habit: Habit = Habit(title: "title", description: "description of habit")
        habit.addToTrack()
        return habit
    }())
}
