//
//  Habit.swift
//  HabitTracker
//
//  Created by Sol Morelli on 21/04/2024.
//

import SwiftData
import Foundation

@Model
class Habit {
    public private(set) var name: String
    public private(set) var color: Int
    public private(set) var visible = true
    public private(set) var calendar: [Int : [Int : Set<Int>]] = [:]
    
    init(_ name: String, color: Int) {
        self.name = name
        self.color = color
    }
    
    #if DEBUG
    init(_ name: String, color: Int, calendar: [Int : [Int : Set<Int>]]) {
        self.name = name
        self.color = color
        self.calendar = calendar
    }
    #endif
    
    func contains(year: Int, month: Int, day: Int) -> Bool {
        calendar[year]?[month]?.contains(day) ?? false
    }
    
    func switchColor() {
        if color < 7 {
            color += 1
        } else {
            color = 0
        }
    }
    
    func toggle(year: Int, month: Int, day: Int) {
        let yearIsOnRecord = calendar[year] != nil
        let monthIsOnRecord = calendar[year]?[month] != nil
        let dayIsOnRecord = calendar[year]?[month]?.contains(day) ?? false
        
        if dayIsOnRecord {
            calendar[year]![month]!.remove(day)
        } else if monthIsOnRecord {
            calendar[year]![month]!.insert(day)
        } else if yearIsOnRecord {
            var newRecord = Set<Int>()
                newRecord.insert(day)
            calendar[year]![month] = newRecord
        } else {
            var newRecord = Set<Int>()
                newRecord.insert(day)
            calendar[year] = [month : newRecord]
        }
    }
    
    func toggleVisibility() {
        visible.toggle()
    }
    
    func updateName(_ newName: String) {
        guard name != "" else { return }
        
        name = newName
    }
}
