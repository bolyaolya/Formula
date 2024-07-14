//
//  DateFormatter+Extension.swift
//  Formula 1
//
//  Created by Olya Boyko on 14.07.2024.
//

import Foundation

extension DateFormatter {
    static var fetchedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

extension DateFormatter {
    func formattedRussianDate(from dateString: String) -> String? {
        self.dateFormat = "yyyy-MM-dd"
        guard let date = self.date(from: dateString) else { return nil }
        
        self.locale = Locale(identifier: "ru_RU")
        self.dateFormat = "d MMMM"
        
        return self.string(from: date)
    }
}
