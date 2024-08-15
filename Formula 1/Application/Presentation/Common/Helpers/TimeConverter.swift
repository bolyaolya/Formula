//
//  TimeConverter.swift
//  Formula 1
//
//  Created by Olya Boyko on 18.07.2024.
//

import Foundation

class TimeConverter {
    func convertUTCToLocal(timeString: String) -> String? {
        let formattedTimeString = timeString.replacingOccurrences(of: "Z", with: "")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let utcDate = dateFormatter.date(from: formattedTimeString) else {
            print("Failed to parse UTC time '\(formattedTimeString)'")
            return nil
        }
        
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = "HH:mm"
        localDateFormatter.timeZone = TimeZone(identifier: "Europe/Moscow")
        
        let localTimeString = localDateFormatter.string(from: utcDate)
        
        return localTimeString
    }
}
