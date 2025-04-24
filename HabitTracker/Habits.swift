//
//  Expenses.swift
//  HabitTracker
//
//  Created by Mike Munhall on 4/19/25.
//

import Foundation

struct Habit: Identifiable, Codable, Hashable {
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
        
        return 0
    }
    
    mutating func addToTrack(date: Date) {
        self.track.insert(date)
    }
    
    mutating func removeFromTrack(date: Date) {
        self.track.remove(date)
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
