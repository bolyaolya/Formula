//
//  Date+Extension.swift
//  Formula 1
//
//  Created by Olya Boyko on 17.07.2024.
//

import Foundation

extension Date {
    func convertToTimeZone(initialTimeZone: TimeZone, to timeZone: TimeZone) -> Date {
        let delta = TimeInterval(timeZone.secondsFromGMT(for: self) - initialTimeZone.secondsFromGMT(for: self))
        return addingTimeInterval(delta)
    }
    
    func dayOfWeek(for timeString: String) -> String {
        guard let date = parseTime(timeString) else {
//            print("Failed to parse date from string: \(timeString)")
            return ""
        }
        
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: date)
        
        switch dayOfWeek {
        case 1:
            return "Воскресенье"
        case 2:
            return "Понедельник"
        case 3:
            return "Вторник"
        case 4:
            return "Среда"
        case 5:
            return "Четверг"
        case 6:
            return "Пятница"
        case 7:
            return "Суббота"
        default:
            return ""
        }
    }
    
    func parseTime(_ timeString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: timeString) {
            return date
        } else {
//            print("Failed to parse date from string: \(timeString)")
            return nil
        }
    }
}
