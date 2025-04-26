//
//  Expenses.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/19/25.
//

import Foundation

struct Habit: Identifiable, Codable, Hashable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var track: Set<Date>
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.track = []
    }
    
    var trackCount: Int {
        self.track.count
    }
    
    var streak: Int {
        var streak = 0
        for date in self.track.sorted().reversed() {
            //print(date)
        }
        return streak
    }
    
    var trackedToday: Bool {
        let today = stripTimeFromDate(Date.now)!
        
        return self.track.contains(today)
    }
    
    mutating func addToTrack(_ date: Date = .now) {
        self.track.insert(stripTimeFromDate(date)!)
    }
    
    mutating func removeFromTrack(_ date: Date = .now) {
        self.track.remove(stripTimeFromDate(date)!)
    }
    
    private func stripTimeFromDate(_ date: Date) -> Date? {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        return Calendar.current.date(from: components)
    }
}

@Observable
class Habits {
    var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
            
        habits = []
    }
}
