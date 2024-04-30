//
//  ShownDate.swift
//  HabitTracker
//
//  Created by Sol Morelli on 24/04/2024.
//

import Foundation

@Observable
class ShownDate: ObservableObject {
    let calendar = Calendar.current
    static let shared = ShownDate()
    
    var day: Int
    var month: Int
    var year: Int
    
    var daysinShownMonth: Int {
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    var formattedMonth: String {
        let dateComponents = DateComponents(year: year, month: month, day: day)
        let date = calendar.date(from: dateComponents)!
        return date.formatted(.dateTime.month(.wide))
    }
    
    var formattedYear: String {
        let dateComponents = DateComponents(year: year, month: month, day: day)
        let date = calendar.date(from: dateComponents)!
        return date.formatted(.dateTime.year())
    }
    
    private init() {
        day = calendar.component(.day, from: Date())
        month = calendar.component(.month, from: Date())
        year = calendar.component(.year, from: Date())
    }
    
    func jumpToNextMonth() {
        guard month < 12 else { return }
        
        month += 1
    }
    
    func jumpToNextYear() {
        guard year < 3000 else { return }
        
        year += 1
    }
    
    func jumpToLastMonth() {
        guard month > 1 else { return }
        
        month -= 1
    }
    
    func jumpToLastYear() {
        guard year > 1 else { return }
        
        year -= 1
    }
    
    func isCurrentDate(day: Int) -> Bool {
        let showingCurrentDay = day == calendar.component(.day, from: Date())
        let showingCurrentMonth = month ==  calendar.component(.month, from: Date())
        let showingCurrentYear = year == calendar.component(.year, from: Date())
        
        return showingCurrentDay && showingCurrentMonth && showingCurrentYear
    }
}
