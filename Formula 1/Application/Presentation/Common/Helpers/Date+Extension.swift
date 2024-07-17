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
}
